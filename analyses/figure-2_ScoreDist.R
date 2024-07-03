###############################################################################
### Figure 2. Distribution of expert scores (n=1040), on Likert scales, for statements 
# referring to two time periods (1900-1967 and 1976-2016) of estimated 
# occupancy trends for each of 52 British butterfly species.
###############################################################################

### Load required package(s)
require("dplyr"); require("RColorBrewer"); require("R.utils"); require("ggplot2"); require("wesanderson")

### Read collated raw expert scores & format
df <- read.csv("./data/ExperstScores_Raw.csv")
# re-code responses from -2 (strongly disagree) to +2 (strongly agree)
df$score <- df$score-3
# specify variable "ID" as discrete factor and order level 
df$ID <- as.factor(as.character(df$ID))
df$ID <- ordered(df$ID, levels = c("1", "2", "3", "4", "5", "6", "7",
                                   "8", "9", "10"))

# new response column based on multiple conditions:
dftemp <- df %>% mutate(response = 
                          case_when(score == -2 ~ "Strongly disagree", 
                                    score == -1 ~ "Disagree", 
                                    score == 0 ~ "Neither agree nor disagree", 
                                    score == 1 ~ "Agree",
                                    score == 2 ~ "Strongly agree"))
# Explicitly define time periods (i.e., question)
names(dftemp)[names(dftemp) == "question"] <- "Time_Period"
dftemp[dftemp$'Time_Period'=="q1", "Time_Period"] <- "1900-1976"
dftemp[dftemp$'Time_Period'=="q2", "Time_Period"] <- "1976-2015"

### Subset and summarise response data as percetages (for each time period)
dftemp <- dftemp %>%
  group_by(Time_Period, response) %>%  # grouping by these two variables
  tally() %>%  # counting the number of responses
  mutate(perc = n / sum(n) * 100) %>%
  dplyr::select(-n) %>%
  group_by(Time_Period) %>%
  spread(response, perc)
# Remove NA column
dftemp <- dftemp[,-7]

dftemp <- dftemp %>%
  mutate(midlow = `Neither agree nor disagree` / 2,
         midhigh = `Neither agree nor disagree` / 2) %>%
  dplyr::select(Time_Period, 'Strongly disagree', 'Disagree', midlow, midhigh, 'Agree', 'Strongly agree') %>%
  gather(key = response, value = perc, 2:7) %>%
  `colnames<-`(c("Time_Period", "response", "perc"))

df_plot_hi <- dftemp %>%
  filter(response %in% c('Strongly agree', 'Agree' , 'midhigh')) %>%
  mutate(response = factor(response, levels = c('Strongly agree', 'Agree' , 'midhigh')))

df_plot_lo <- dftemp %>%
  filter(response %in% c("midlow", "Disagree", "Strongly disagree")) %>%
  mutate(response = factor(response, levels = c("Strongly disagree", "Disagree", "midlow")))

# Use wesanderson to store a preset diverging colour palette as a vector of colour codes
mycols <- wes_palette("Zissou1", n=15, type="continuous")[c(12,8,7,5,1)]
# Duplicate the middle value since "Neither agree nor disagree" is two groups: "midhigh" and "midlow"
mycols <- insert(mycols, ats = 3, wes_palette("Zissou1", n=10, type="continuous")[c(5)])
# Replace the ugly white colour for "Neither agree nor disagree" with a pleasant dishwater grey
mycols <- gsub("#CAC656", "#9C9C9C", mycols) # <0% i.e., midlow
mycols <- gsub("#D1C74C", "#9C9C9C", mycols) # >0% i.e., midhigh
# Assign names to the vector based on the colours we want for each group
names(mycols) <- c('Strongly disagree', 'Disagree', 'midhigh', 'midlow', "Agree", "Strongly agree")

### Plot figure
p <- ggplot() +
  geom_bar(data = df_plot_hi, aes(x = Time_Period, y=perc, fill = response), stat="identity") +
  geom_bar(data = df_plot_lo, aes(x = Time_Period, y=-perc, fill = response), stat="identity") +
  geom_hline(yintercept = 0, color =c("black")) +
  scale_fill_manual(values = mycols,
                    breaks = c('Strongly agree', 'Agree', 'midhigh', 
                               "Disagree", "Strongly disagree"),
                    labels = c('Strongly agree', 'Agree', 
                               'Neither agree nor disagree', 
                               "Disagree", "Strongly disagree")) +
  coord_flip() +
  labs(x = "Time Period", 
       y = "Percentage of answers (%)",
       fill = "Score")+
  theme_classic() +
  theme(text = element_text(size = 14)) 

### Save figure
#ggsave("./figures/figure-2_ScoreDistribution.png", width=7, height=4)