#############################################################################
### NOTE: Script for plotting Figure 3.B. and both of A-B as separate panels 
# in one figure can be found after the code for Figure 3.A. in this script
#############################################################################


###############################################################################
### Figure 3.A. Mean expert scores of 52 British butterfly species occupancy 
# trends for each of two time periods between 1900 and 2016 against variance 
# across species for each of ten expert respondent. The two time periods 
# 1900-1976 and 1976-2016 are denoted by diamonds and circles, respectively, 
# and are connected by grey lines. Colours indicate individual respondents.
###############################################################################

### Load required package(s)
require(tidyr); require(dplyr); require(ggplot2); require(RColorBrewer)

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


#############################################################################
### Figure 3.B.  Mean expert scores of 52 British butterfly species occupancy 
# trends for each of two time periods between 1900 and 2016 against unanimity 
# (1-variance) across respondents for each of the 52 species. The two time 
# periods 1900-1976 and 1976-2016 are denoted by diamonds and circles, 
# respectively. Grey lines connect individual species’ mean scores for the 
# two time periods, and the black line is a constraint to unanimity-values 
# (if everyone agrees, the statement is also unanimous). 
#############################################################################

### Define constraint Line
constraintLine <- data.frame(nMax = as.numeric(0:10), nMin = as.numeric(10:0),
                             mean = as.numeric(rep(NA, 11)), # To populate
                             unanimity = as.numeric(rep(NA, 11))) # To populate
# Loop through each row with number of possible extremes (2 or -2) 
for(i in 1:nrow(constraintLine)){ # For each row, create a vector with ten (10) elements:
  temp <- append(rep(-2, constraintLine$nMax[[i]]), # nMax times 2 ('Strongly agree')
                 rep(2, constraintLine$nMin[[i]])) # nMin times -2 ('Strongly disagree')
  constraintLine$mean[[i]] <- mean(temp) # Use vector to find mean
  constraintLine$unanimity[[i]] <- 1-var(temp) # and unanimity
}

### Read collated raw expert scores & format
df <- read.csv("./data/ExperstScores_Raw.csv")
# re-code responses from -2 (strongly disagree) to +2 (strongly agree)
df$score <- df$score-3
### Subset and summarise response data
df3 <- as.data.frame(na.omit(df[, c("spp_name", "question", "score")]) %>% 
                       group_by(spp_name, question) %>% 
                       summarise(Mean = mean(score), Unanimity = (1 - (var(score)))))

# Define colours
cols <- c("#E69F00", "#009E73")

### Graph
q <- ggplot(df3, aes(Mean, Unanimity)) + 
  geom_line(aes(group = spp_name), color="grey") + # Line between same species' time periods
  geom_jitter(width = 0.04, height = 0.04, 
              aes(group = question, shape=question, colour=question),
              size=3.5) + # use jitter over geom_points to reveal overlapping points
  geom_line(aes(mean, unanimity), constraintLine) + # Add constraint line
  scale_shape_manual("Time Period", 
                     values=c(18,20),
                     labels = c("1900-1976", "1976-2016")) +
  scale_colour_manual("Time Period", values=cols,
                      labels = c("1900-1976", "1976-2016")) +
  labs(x = "Mean Score", y = "
       Unanimity") +
  theme(legend.key = element_rect(fill = "white", color = NA)) +
  theme(panel.background=element_rect(fill="white", colour="black")) +
  coord_cartesian(ylim=c(-1.6, 1)) +
  theme(text = element_text(size = 14))

### Save figure
#ggsave("./figures/figure-3B_UnanimityMean.png",width=7,height=4)


#############################################################################
#############################################################################
#############################################################################
### Figure 3.A-B as separate panels in one figure

require(ggpubr)
ggarrange(p, q, 
          labels = c("(A)", "(B)"),
          ncol = 1, nrow = 2)
#ggsave("./figures/figure-3AB.png", width=7, height=8)
#############################################################################