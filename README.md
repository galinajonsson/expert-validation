# Expert elicitation as a complementary approach to statistical model validation

Author(s): [Galina M. Jönsson](https://github.com/galinajonsson)

This repository contains all the code for:

>Jönsson, G. M., **[Insert co-authors]**, and Isaac, N. J. B. (in press.). Expert elicitation as a complimentary approach to statistical model validation. **Pre-print**.

## Sub-repository: app_ExpertReviewForm
As of 20 May 2023, the sub-repository containing all code for the Google Sheets-linked R Shiny apps used to distribute the questionnaires and collect responses is not publicly available for anonymity purposes. Specifically, the repository contains information which may reveal the identity experts on our panel, and I have not, at present, requested consent to publish such information here. The code was modified from [Pescott (2022)](https://zenodo.org/record/7082588). 


## Data

**[UPDATE]** As of 20 May 2023, I have not uploaded the expert scores for the same reason as above. 

* `data/trend-figures` is a sub-folder containing all figures showing long-term trends assessed by the expert panel. The figures show annual (1900-2015) occupancy estimates for each of the 52 butterfly species, with the best estimate of occupancy shown as a black line and uncertainty around estimates (95% credible intervals) represented as a grey ribbon. A vertical red line marked the year 1976. All figures are presented as .png files named as follows: `genus.species.png`.    



## Analyses

The code for all analyses in the main text of the manuscript are divided into **[UPDATE NUMBER]** .Rmd files and for some of the associated Supplementary Information (summaries of each .Rmd file are given below). Note that this repository does not contain code for Supplementary Information **[1-2?; UPDATE NUMBER]** of the current manuscript. For this code, please see [my separate repository here](https://github.com/galinajonsson/LepidopteraTrends). Separate detailed scripts (.R files) for some functions called called by the .Rmd files, and for each figure in the main text of the manuscript are also given. 

I have generally commented out `write.csv` and `saveRDS` commands in order to not clog up your machine. For code chunks that run the models, I've set `eval` to FALSE, again, to not clog up your machine as the analyses are computationally expensive and were run on high performance machines.

* __01-ExploreResults.Rdm__ summarises and analyses the expert scores.      
* __02-.Rdm__ summarises and analyses the expert scores.      


__Code - Custom Functions__
* __01-ExploreResults.R__ summarises and analyses the expert scores.      
* __02-.Rdm__ summarises and analyses the expert scores.   


__Code - Figures__
* __01-ExploreResults.Rdm__ summarises and analyses the expert scores.      
* __02-.Rdm__ summarises and analyses the expert scores.   




## Other folders

* `/figs` contains the figures with file names matching the numbering in the manuscript
* `/output` contains the empty subfolders /output/formattedData and /output/modelOutputs, as well as the subfolder /output/summaryTables that contains tables summarising both the data used in models and model outputs. For reproducibility purposes, format the raw data according to the code in /analyses/02-format-data.Rdm and place into /output/formattedData, and download the model outputs and place into /output/modelOutputs. All model outputs are available via the NHM data portal.


## Session Info
For reproducibility purposes, here is the output of devtools::session_info() used to perform the analyses in the publication.
```