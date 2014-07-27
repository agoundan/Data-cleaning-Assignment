---
title: "Getting and Cleaning Data Course Project"
author: "Anatole"
date: "27/07/2014"
output: html_document
---

## About Contents of my repo

This repository contains three files. This first one the code book file ("CodeBook.md). We have this ReadMe file  "README.md" and the R-script file,"run_analysis.R".


## Details on R scipt *run_analysis.R*

The code has three parts:
- The first concerns data imports and manipulation
- the second and the third parts are related to the two data sets built.

### Data imports and transformations
here used basics function such as **read.table**, **cbind** and **rbind**.

### Part two: first data set

We only extracts the subset asked by the use of **grep** function in order to 
select only appropriate variable names.

### part two: Second data set

We used here **sapply** function, **split** and the loop **for**.


