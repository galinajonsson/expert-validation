# Expert elicitation as a complementary approach to statistical model validation

Author(s): [Galina M. Jönsson](https://github.com/galinajonsson)

This repository contains all the code for:

>Jönsson, G. M., **[Insert co-authors]**, and Isaac, N. J. B. (in press.). Expert elicitation as a complimentary approach to statistical model validation. [*Ecography*](https://nsojournals.onlinelibrary.wiley.com/journal/16000587).


## Sub-repository: app_ExpertReviewForm
As of 20 May 2023, the sub-repository containing all code for the Google Sheets-linked R Shiny apps used to distribute the questionnaires and collect responses is not publicly available for anonymity purposes. Specifically, this repository contains information which may reveal the identity experts on our panel, and I have not, at present, requested consent to publish such information here. The code was modified from [Pescott (2022)](https://zenodo.org/record/7082588). 

To see a replica of the full interactive questionnaire design, [click here](https://galinajoensson.shinyapps.io/appLepTrendExOP07/), but please **note** that this application and its associated Google Sheet were made available online 17 May 2023, and that it is not actively monitored nor maintained. Although the expert questionnaires used in analyses were individualised (i.e., one application per expert), the application shared [here](https://galinajoensson.shinyapps.io/appLepTrendExOP07/) is not. Therefore, any potential activity and saved scores previously submitted by anyone with access to the link will be visible.


## Data

**[UPDATE]** As of 20 May 2023, I have not uploaded the expert scores for the same reason as stated above. 

* `data/trend-figures` is a sub-folder containing the long-term trends assessed by the expert panel required for producing the figures presented in the manuscript. All other specie-slots have been omitted. Feel free to contact the lead author if you would like access to these remaining species'. Please note that the long-term trends show annual (1900-2015) occupancy estimates for individual butterfly species, with the best estimate of occupancy shown as a black line and uncertainty around estimates (95% credible intervals) represented as a grey ribbon. A vertical red line marked the year 1976. The graphs are presented as .png files named as follows: `genus.species.png`.    


## Output


## Analyses

The code for all analyses in the main text of the manuscript are divided into **[UPDATE NUMBER]** .Rmd files and for some of the associated Supplementary Information (summaries of each .Rmd file are given below). Note that this repository does not contain code for Supplementary Information **[1-2?; UPDATE NUMBER]** of the current manuscript. For this code, please see [my separate repository here](https://github.com/galinajonsson/LepidopteraTrends). Separate detailed scripts (.R files) for some functions called called by the .Rmd files, and for each figure in the main text of the manuscript are also given. 

I have generally commented out `write.csv` and `saveRDS` commands in order to not clog up your machine. For code chunks that run the models, I've set `eval` to FALSE, again, to not clog up your machine as the analyses are computationally expensive and were run on high performance machines.

* __01-ExploreScores.Rdm__ formats, summarises, visualises and analyses the raw expert scores.      
* __02-DataAnalysis.Rmd__ 
* __03-ResamplingExercise.Rmd__ re-sampling exercise testing whether our expert number biases score result.   


__Code - Figures__
* __figure-1_.R__      
* __figure-Box-1_TempDistAllButterflyRecords.R__  
* __figure-2_ScoreDist.R__   
* __figure-3AB_MeanVar_UnanimityMean.R__     
* __figure-4_ScoreDist.R__   




## Other folders

* `/figures` contains the figures with file names matching the numbering in the manuscript
* `/output` contains the empty subfolders /output/formattedData and /output/modelOutputs, as well as the subfolder /output/summaryTables that contains tables summarising both the data used in models and model outputs. For reproducibility purposes, format the raw data according to the code in /analyses/02-format-data.Rdm and place into /output/formattedData, and download the model outputs and place into /output/modelOutputs. All model outputs are available via the NHM data portal.


## Session Info
For reproducibility purposes, here is the output of devtools::session_info() used to perform the analyses in the publication.
```
─ Session info ──────────────────────────────────────────────────────────────────────────────────────────────────────
 setting  value
 version  R version 4.0.2 (2020-06-22)
 os       OS X  14.5
 system   x86_64, darwin17.0
 ui       RStudio
 language (EN)
 collate  en_US.UTF-8
 ctype    en_US.UTF-8
 tz       Europe/London
 date     2024-08-08
 rstudio  2024.04.2+764 Chocolate Cosmos (desktop)
 pandoc   3.1.11 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/x86_64/ (via rmarkdown)

─ Packages ──────────────────────────────────────────────────────────────────────────────────────────────────────────
 package      * version    date (UTC) lib source
 abind          1.4-5      2016-07-21 [2] CRAN (R 4.0.2)
 assertthat     0.2.1      2019-03-21 [2] CRAN (R 4.0.2)
 backports      1.4.1      2021-12-13 [2] CRAN (R 4.0.2)
 boot           1.3-28.1   2022-11-22 [2] CRAN (R 4.0.2)
 broom          1.0.3      2023-01-25 [2] CRAN (R 4.0.2)
 bslib          0.2.5.1    2021-05-18 [2] CRAN (R 4.0.2)
 cachem         1.0.6      2021-08-19 [2] CRAN (R 4.0.2)
 callr          3.7.0      2021-04-20 [2] CRAN (R 4.0.2)
 car          * 3.1-1      2022-10-19 [2] CRAN (R 4.0.2)
 carData      * 3.0-5      2022-01-06 [2] CRAN (R 4.0.5)
 cli            3.6.0      2023-01-09 [2] CRAN (R 4.0.2)
 coda           0.19-4     2020-09-30 [2] CRAN (R 4.0.2)
 codetools      0.2-18     2020-11-04 [2] CRAN (R 4.0.2)
 colorspace     2.0-3      2022-02-21 [2] CRAN (R 4.0.5)
 cowplot        1.1.1      2020-12-30 [2] CRAN (R 4.0.2)
 crayon         1.5.2      2022-09-29 [2] CRAN (R 4.0.2)
 DBI            1.1.3      2022-06-18 [2] CRAN (R 4.0.2)
 devtools       2.4.5      2022-10-11 [2] CRAN (R 4.0.2)
 digest         0.6.29     2021-12-01 [2] CRAN (R 4.0.2)
 dplyr        * 1.0.10     2022-09-01 [2] CRAN (R 4.0.2)
 effects      * 4.2-2      2022-07-13 [2] CRAN (R 4.0.2)
 ellipsis       0.3.2      2021-04-29 [2] CRAN (R 4.0.2)
 emmeans        1.6.0      2021-04-24 [2] CRAN (R 4.0.2)
 estimability   1.4.1      2022-08-05 [2] CRAN (R 4.0.2)
 evaluate       0.20       2023-01-17 [2] CRAN (R 4.0.2)
 fansi          1.0.4      2023-01-22 [2] CRAN (R 4.0.2)
 farver         2.1.0      2021-02-28 [2] CRAN (R 4.0.2)
 fastmap        1.1.0      2021-01-25 [2] CRAN (R 4.0.2)
 fs             1.5.2      2021-12-08 [2] CRAN (R 4.0.2)
 generics       0.1.3      2022-07-05 [2] CRAN (R 4.0.2)
 ggplot2      * 3.4.0      2022-11-04 [2] CRAN (R 4.0.2)
 ggpubr       * 0.4.0      2020-06-27 [2] CRAN (R 4.0.2)
 ggridges     * 0.5.3      2021-01-08 [2] CRAN (R 4.0.2)
 ggsignif       0.6.1      2021-02-23 [2] CRAN (R 4.0.2)
 glmmTMB      * 1.1.3      2022-03-13 [1] CRAN (R 4.0.5)
 glue           1.6.2      2022-02-24 [2] CRAN (R 4.0.5)
 gtable         0.3.1      2022-09-01 [2] CRAN (R 4.0.2)
 highr          0.10       2022-12-22 [2] CRAN (R 4.0.2)
 htmltools      0.5.5      2023-03-23 [1] CRAN (R 4.0.2)
 htmlwidgets    1.6.2      2023-03-17 [1] CRAN (R 4.0.2)
 httpuv         1.6.5      2022-01-05 [2] CRAN (R 4.0.5)
 insight        0.18.8     2022-11-24 [2] CRAN (R 4.0.2)
 jquerylib      0.1.4      2021-04-26 [2] CRAN (R 4.0.2)
 jsonlite       1.8.4      2022-12-06 [2] CRAN (R 4.0.2)
 knitr        * 1.33       2021-04-24 [2] CRAN (R 4.0.2)
 labeling       0.4.2      2020-10-20 [2] CRAN (R 4.0.2)
 later          1.3.0      2021-08-18 [2] CRAN (R 4.0.2)
 lattice      * 0.20-45    2021-09-22 [2] CRAN (R 4.0.2)
 lifecycle      1.0.3      2022-10-07 [2] CRAN (R 4.0.2)
 lme4         * 1.1-35.5   2024-07-03 [1] CRAN (R 4.0.2)
 magrittr       2.0.3      2022-03-30 [2] CRAN (R 4.0.5)
 MASS           7.3-56     2022-03-23 [2] CRAN (R 4.0.5)
 Matrix       * 1.4-1      2022-03-23 [2] CRAN (R 4.0.5)
 memoise        2.0.1      2021-11-26 [2] CRAN (R 4.0.2)
 mime           0.12       2021-09-28 [2] CRAN (R 4.0.2)
 miniUI         0.1.1.1    2018-05-18 [2] CRAN (R 4.0.2)
 minqa          1.2.7      2024-05-20 [1] CRAN (R 4.0.2)
 mitools        2.4        2019-04-26 [2] CRAN (R 4.0.2)
 multcomp       1.4-20     2022-08-07 [2] CRAN (R 4.0.2)
 munsell        0.5.0      2018-06-12 [2] CRAN (R 4.0.2)
 mvtnorm        1.1-3      2021-10-08 [2] CRAN (R 4.0.2)
 nlme           3.1-157    2022-03-25 [2] CRAN (R 4.0.5)
 nloptr         2.0.0      2022-01-26 [2] CRAN (R 4.0.5)
 nnet           7.3-17     2022-01-13 [2] CRAN (R 4.0.5)
 numDeriv       2016.8-1.1 2019-06-06 [2] CRAN (R 4.0.2)
 pillar         1.8.1      2022-08-19 [2] CRAN (R 4.0.2)
 pkgbuild       1.4.0      2022-11-27 [2] CRAN (R 4.0.2)
 pkgconfig      2.0.3      2019-09-22 [2] CRAN (R 4.0.2)
 pkgload        1.3.2      2022-11-16 [2] CRAN (R 4.0.2)
 plyr           1.8.7      2022-03-24 [2] CRAN (R 4.0.5)
 prettyunits    1.1.1      2020-01-24 [2] CRAN (R 4.0.2)
 processx       3.5.3      2022-03-25 [2] CRAN (R 4.0.5)
 profvis        0.3.7      2020-11-02 [2] CRAN (R 4.0.2)
 promises       1.2.0.1    2021-02-11 [2] CRAN (R 4.0.2)
 ps             1.6.0      2021-02-28 [2] CRAN (R 4.0.2)
 purrr          1.0.1      2023-01-10 [2] CRAN (R 4.0.2)
 R.methodsS3  * 1.8.2      2022-06-13 [2] CRAN (R 4.0.2)
 R.oo         * 1.25.0     2022-06-12 [2] CRAN (R 4.0.2)
 R.utils      * 2.12.2     2022-11-11 [2] CRAN (R 4.0.2)
 R6             2.5.1      2021-08-19 [2] CRAN (R 4.0.2)
 RColorBrewer * 1.1-3      2022-04-03 [2] CRAN (R 4.0.5)
 Rcpp           1.0.12     2024-01-09 [1] CRAN (R 4.0.2)
 remotes        2.4.2      2021-11-30 [2] CRAN (R 4.0.2)
 rlang          1.1.4      2024-06-04 [1] CRAN (R 4.0.2)
 rmarkdown      2.20       2023-01-19 [2] CRAN (R 4.0.2)
 rsconnect      0.8.29     2023-01-09 [2] CRAN (R 4.0.2)
 rstatix        0.7.1      2022-11-09 [2] CRAN (R 4.0.2)
 rstudioapi     0.14       2022-08-22 [2] CRAN (R 4.0.2)
 sandwich       3.0-2      2022-06-15 [2] CRAN (R 4.0.2)
 sass           0.4.1      2022-03-23 [2] CRAN (R 4.0.5)
 scales         1.2.1      2022-08-20 [2] CRAN (R 4.0.2)
 sessioninfo    1.2.2      2021-12-06 [2] CRAN (R 4.0.2)
 shiny          1.6.0      2021-01-25 [2] CRAN (R 4.0.2)
 stringi        1.7.12     2023-01-11 [2] CRAN (R 4.0.2)
 stringr        1.5.0      2022-12-02 [2] CRAN (R 4.0.2)
 survey         4.1-1      2021-07-19 [2] CRAN (R 4.0.2)
 survival       3.3-1      2022-03-03 [2] CRAN (R 4.0.5)
 TH.data        1.1-1      2022-04-26 [2] CRAN (R 4.0.2)
 tibble         3.1.8      2022-07-22 [2] CRAN (R 4.0.2)
 tidyr        * 1.3.0      2023-01-24 [2] CRAN (R 4.0.2)
 tidyselect     1.2.0      2022-10-10 [2] CRAN (R 4.0.2)
 TMB            1.8.0      2022-03-07 [1] CRAN (R 4.0.2)
 urlchecker     1.0.1      2021-11-30 [2] CRAN (R 4.0.2)
 usethis        2.2.3      2024-02-19 [1] CRAN (R 4.0.2)
 utf8           1.2.2      2021-07-24 [2] CRAN (R 4.0.2)
 vctrs          0.5.2      2023-01-23 [2] CRAN (R 4.0.2)
 viridisLite    0.4.1      2022-08-22 [2] CRAN (R 4.0.2)
 wesanderson  * 0.3.6      2018-04-20 [2] CRAN (R 4.0.2)
 withr          2.5.0      2022-03-03 [2] CRAN (R 4.0.5)
 xfun           0.36       2022-12-21 [2] CRAN (R 4.0.2)
 xtable         1.8-4      2019-04-21 [2] CRAN (R 4.0.2)
 yaml           2.3.5      2022-02-21 [2] CRAN (R 4.0.5)
 zoo            1.8-9      2021-03-09 [2] CRAN (R 4.0.2)

 [1] /Users/galinajonsson/Library/R/4.0/library
 [2] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
 ```