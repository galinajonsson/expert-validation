### Box 1 Figure 1: Temporal distribution of records for 52 British butterfly 
# species from 1900-2015 by data type (totalling 5,586,795 records). 
###########################################################################
# The data types are: (i) Natural History Museum (NHM; blue; 33,600 records), 
# (ii) Butterflies for a New Millennium, excluding UKBMS (BNM; green; 4,219,404 records), 
# and (iii) UK Butterfly Monitoring Scheme (UKBMS; yellow; 1,333,791 records). 
# The red rectangle indicates the period between 1960-1980 (the data handover period), 
# and the red vertical line indicates the year 1976. Note that the y-axis is 
# plotted on a square root scale.

### Load required packages
require(ggplot2); require(wesanderson) 

# read occDet file (from model)
dat <- read.csv("./data/occDetdata_merged_2020-04-07.csv")
# add and fill data type column 
dat$DT <- as.character('na')
dat$DT[dat$L<22222] <- "BNM"
dat$DT[dat$L==22222] <- "UKBMS"
dat$DT[dat$L==33333] <- "NHM"
dat$DT <- as.factor(dat$DT) 
dat$DT <- ordered(dat$DT, levels = c("NHM", "BNM", "UKBMS")) # order factors

# read spp_vis file (from model)
spp_vis <- read.csv("./data/spp_vis_merged_2020-04-07.csv")
# find list length per visit & get rid of spp names
spp_vis$obs <- rowSums(spp_vis[2:55], na.rm = TRUE)
spp_vis <- spp_vis[,c("visit", "obs")]

# merge with first data set 
dat <- merge(dat, spp_vis, by = "visit")
# to duplicate rows in orig data by list length in spp_vis
dat <- data.frame(dat[rep(seq_len(dim(dat)[1]), dat$obs), 
                      2:5, drop = FALSE], row.names=NULL)
# Default fist year is 1 so add 1899
dat$TP <- dat$TP+1899

### Plot
p <- ggplot(dat,aes(x=TP, group=DT, fill=DT))+
  geom_histogram(position="stack",  # obs stack, not on top of one another
                 binwidth = 1, boundary = 1900) + theme_bw(base_size = 15) +
  scale_x_continuous(expand = c(0, 0)) + scale_y_sqrt(expand = c(0, 0)) +
  # add red translucent red rectangle over data handover period
  annotate("rect", xmin=1960, xmax=1980, ymin=0, ymax=Inf, alpha=0.2, fill="red") +
  geom_histogram(position="stack", # replot histogram to be on top of rectangle
                 binwidth = 1, boundary = 1900) 
p <- p + labs(x = "Year", y = "Records", colour = "Data Type") # titles
p <- p + guides(fill=guide_legend(title="Data Type")) + # Colours
  scale_color_manual(values=wes_palette("Zissou1", n=10, type="continuous")[c(1,4,7)]) +
  scale_fill_manual(values=wes_palette("Zissou1", n=10, type="continuous")[c(1,4,7)]) +
  geom_vline(xintercept = 1976, colour = "red") 

### Save
#ggsave("./figures/ms_Box1_Figure1.png", width = 17, height = 10, units = c("cm"))
