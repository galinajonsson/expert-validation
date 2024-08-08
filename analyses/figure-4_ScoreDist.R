###############################################################################
### Figure 4. Distribution of mean scores and unanimity (lefthand side and 
# righthand side, respectively) for statements referring to the two time 
# periods (A) 1900-1967 and (B) 1976-2016 of estimated occupancy trends for 
# each of 52 British butterfly species (n=1040 total scores; n=10 scores per 
# statement). Panel (C) shows the difference between the two time periods 
# calculated as values for the early period minus values for the late period.
###############################################################################

### Load required package(s)
require(tidyr); require(dplyr); require(ggplot2); require(RColorBrewer)

### To facetwrap, I'll need to restructure the df 
df3mean <- df3[,c("spp_name", "question", "Mean")] # Separate into two dfs
df3mean$Difference <- 'Mean' # New column indicating score ID
# Rename "Mean_diff" column to identical as Unanimity df (below)
names(df3mean)[names(df3mean) == "Mean"] <- "value"

### Repeat for Unanimity
df3unanimity <- df3[,c("spp_name", "question", "Unanimity")]  
df3unanimity$Difference <- 'Unanimity'
names(df3unanimity)[names(df3unanimity) == "Unanimity"] <- "value"

### combine the two data frames
df3b <- rbind(df3mean, df3unanimity)

# Vectorise species' names
spp <- as.factor(unique(df3$spp_name))
# Empty data frame to populate
df4 <- data.frame(spp_name = spp,
                  name = as.character(rep("Difference"), 52),
                  Mean_diff = as.numeric(rep(NA, 52)),
                  Unanimity_diff = as.numeric(rep(NA, 52)))

# Loop through species and subtract post-1976 scores from pre-1976 scores
for(i in 1:length(spp)){
  temp <- df3[df3$spp_name == paste0(spp[i]), ]
  df4[df4$spp_name == paste0(spp[i]), "Mean_diff"] <- ((temp[temp$question == "q1",]$Mean) - 
                                                         (temp[temp$question == "q2",]$Mean))
  df4[df4$spp_name == paste0(spp[i]), "Unanimity_diff"] <- ((temp[temp$question == "q1",]$Unanimity) - 
                                                              (temp[temp$question == "q2",]$Unanimity))
}

# Separate into two dfs
df4mean <- df4[,c("spp_name", "name", "Mean_diff")]
# New column indicating score ID
df4mean$Difference <- 'Mean'
# Rename "Mean_diff" column to identical as Unanimity df (below)
names(df4mean)[names(df4mean) == "Mean_diff"] <- "value"
### Repeat for Unanimity
df4unanimity <- df4[,c("spp_name", "name", "Unanimity_diff")]
df4unanimity$Difference <- 'Unanimity'
names(df4unanimity)[names(df4unanimity) == "Unanimity_diff"] <- "value"
df4 <- rbind(df4mean, df4unanimity) # combine the two data frames
names(df4)[names(df4) == "name"] <- "question"
df_test2 <- rbind(df4, df3b)# combine the two data frames
# specify question values 
df_test2[df_test2$question=="q1", "question"] <- "1900-1976"
df_test2[df_test2$question=="q2", "question"] <- "1976-2016"

### Plot
ggplot(df_test2, aes(value, group = spp_name)) + geom_histogram(bins = 14)  + 
  facet_grid(question ~ Difference ) +
  labs(x = "Score", y = "Species",
       title ="Figure D: Mean- and unanimity scores by time period 
  and the species-specific differences between periods") +
  theme(legend.key = element_rect(fill = "white", color = NA)) +
  theme(panel.background=element_rect(fill="white", colour="black")) +
  theme(legend.position="none") +
  scale_fill_hue(c=45, l=80) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, NA)) +
  theme(text = element_text(size = 14))  



