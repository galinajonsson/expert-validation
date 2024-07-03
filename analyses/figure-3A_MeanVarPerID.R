###############################################################################
### Figure 3.A. Mean expert scores of 52 British butterfly species occupancy 
# trends for each of two time periods between 1900 and 2016 against variance 
# across species for each of ten expert respondent. The two time periods 
# 1900-1976 and 1976-2016 are denoted by diamonds and circles, respectively, 
# and are connected by grey lines. Colours indicate individual respondents.
###############################################################################

### Load required package(s)
require(tidyr); require(dplyr); require(ggplot2)

### Read collated raw expert scores & format
df <- read.csv("./data/ExperstScores_Raw.csv")
# re-code responses from -2 (strongly disagree) to +2 (strongly agree)
df$score <- df$score-3
# specify variable "question" (corresponding to time period) as discrete factor
df$question <- as.factor(df$question)
# specify variable "ID" as discrete factor and order level 
df$ID <- as.factor(as.character(df$ID))
df$ID <- ordered(df$ID, levels = c("1", "2", "3", "4", "5", "6", "7",
                                   "8", "9", "10"))

### Subset and summarise response data
df <- as.data.frame(na.omit(df[, c("ID", "question", "score")]) 
                     %>% group_by(ID, question) %>% 
                       summarise(Mean = mean(score), Variance = (var(score))))

### Plot
# Define colour blind friendly palette
cbPalette <- c("grey36", "#E69F00", "#009E73", "#66CC99", "#F0E442",
               "#56B4E9", "#0072B2",  "#9999CC", "#CC79A7", "#D55E00") 
# define arguments for graph
p <- ggplot() + 
  geom_line(aes(Mean, Variance, group = ID), df, color="grey") + # Line between same species' time periods
  geom_point(aes(Mean, Variance, shape=question, size=question, colour=ID), 
             df, size=4.5, position = "jitter") + 
  scale_shape_manual(name="\nTime Period", 
                     values=c(18,20), 
                     labels = c("1900-1976", "1976-2016")) +
  scale_colour_manual(name="Participant ID", values=cbPalette) +
  labs(x = "Mean Score",
       y = "
       Variance") +
  theme(legend.key = element_rect(fill = "white", colour = NA)) +
  theme(panel.background = element_rect(fill = "white", colour = "black")) +
  guides(size = "none",
         shape = guide_legend(order=1),
         colour = guide_legend(order=2)) +
  # ID legend colour shape different to either time period
  guides(colour = guide_legend(override.aes = list(shape = c(15,15,15,15,15,15,15,15,15,15),
                                                   size = 3.7))) + 
  theme(text = element_text(size = 14))

### Save figure
#ggsave("./figures/figure-3A_IDMeanVar.png",width=7,height=4)