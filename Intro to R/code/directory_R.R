# devtools::install_github("YuLab-SMU/ggtree")
#  devtools::install_github("YuLab-SMU/ggtree")
if (!require(pacman)) install.packages('pacman', repos = 'https://cran.rstudio.com')

pacman::p_load(
  tidyverse, 
  dplyr, magrittr,  # from tidyverse 
  data.table, 
  testit, # assert() function 
  scales, # breaks and labels for axes and legends
  haven, # read_dta
  stargazer, # export regression table
  # starpolishr, # complementary package of stargazer
  lfe, # fixed effect regression
  fixest, # (fast) fixed effect regression
  modelsummary, # get estimated model from regression
  stringr, # from tidyverse: some useful string functions
  stats, # some statistical calculations and random number generation.
  ggsignif # add mean comparison with significant values in graph
)
options(dplyr.summarise.inform = FALSE)

library(devtools) 


# Clearing workspace
rm(list=ls())


# Getting folder directories
if (Sys.getenv("USER") == "haoyangxie") {
  CODEDIR <- "xie haoyang fill this in "
} else if (Sys.getenv("USER") == "yixinzhou") {
  # You should have a BOX/Dropbox folder that stores all the data, figures, and tables 
  # For this orientation, we are just going to put the data on github for illustration purpose
  # But that's a not a good practice
  REPODIR <- "/Users/yixinzhou/Desktop/Github/RP-orientation-2022/Intro to R"
}

CODEDIR <- "code"
DATADIR <- "data_csv"
# FIGDIR <- paste(DBDIR, "figures", sep = "/") # assuming that you have a dropbox directory 

# Setting working directory
setwd(paste(REPODIR, CODEDIR, sep = "/"))

