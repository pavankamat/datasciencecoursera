---
title: "Cleaning and Getting Data Course Project"
author: "Pavan Kamat"
date: "10/13/2016"
output: html_document
---

This Git repository holds the code, data and documentation for the "Getting and Cleaning data" course project.

## Files

* **CodeBook.md** - describes tsource of data, variables used and the transformations/work that was performed to clean up the data to output a tidy data set.

* **README.md** - Instructions on project files/folder and script execution.

* **run_analysis.R** - This file contains the actual code to perform the transformation of the source to the final Tidy Data Set.

* **TidyDataSet.txt** - This is the final tidy data set file after running the run_analysis.R R script.

* **CodeBook.html** - Generated file from the CodeBook.md file

* **README.html** - Generated file from the README.md file

* **/UCI HAR Dataset** - Folder with the downloaded and unzipped data source files

## Script Execution

* Downloaded and extract the source data to a folder in the current working directory. This will result in a folder  called 'UCI HAR Dataset' with all the relevant data and information files.

* Run the run_analysis.R script by either importing it in RStudio or directly running it using R command prompt outside of the RStudio.

* The output of running the run_analysis.R script will be the 'TidyDataSet.txt' file.
