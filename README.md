CleaningData
============

Assignment Requirements
------------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Data Cleaning Scripts
------------
This submission contains a script named 'run_analysis.R' that generates all required datasets.

The script assumes the data files were already extracted into the same working directory.

The first part of the script assembles test and training data into a full dataset.

First, the script reads in the following files:
test/X_test.txt (all test data)
test/y_test.txt (test activity)
test/subject_test.txt (test subject information)
training/X_training.txt (all training data)
training/y_training.txt (training activity)
training/subject_training.txt (training subject information)
features.txt (column names for test and training data)
activity_labels.txt (code table for activities)

It creates a data frame containing all columns in the X_*** files, as well as activities, and subject information. To distinguish test and training data, an extra column named "DataType" was created.

Subsequently, a subset of the data was created for all columns containing mean or std as required by the assignment.

From the subset of the data, a tidy dataset was also created, which averaged each column by activity and by subject.

Code Book
------------
Please refer to the file 'Codebook.md' for more details.
