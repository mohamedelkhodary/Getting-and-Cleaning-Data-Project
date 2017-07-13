==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Mohamed Elkhodary
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

===========================================================================================================================

Description of how the script work 
==================================

=====>> loading required packages


=====>> setting working directory and preparing workspace 


=====>> loading all data files needed and preparing them by selection of variables, filtering and giving proper names for           variables besides holding differnt operations to prepare each separated dataframe to be ready for merging and               binding


=====>> Merges the training and the test sets to create one data set.



=====>> Extracts only the measurements on the mean and standard deviation for each measurement.



=====>> Uses descriptive activity names to name the activities in the data set



=====>> Appropriately labels the data set with descriptive variable names.



=====>> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each         activity and each subject.



=====>> prepare the final dataframe to be written




=====>> write the data onto atext file to be uploaded


===========================================================================================================================


Input
-----

Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
hint "input shall be unzipped"


Analysis Script
---------------

`run_analysis.R`: this script takes the input data, and creates the output file. 

NOTE: To run the run_analysis.R script, the data must be in \data\UCI HAR Dataset\*

The script first downloads and unzips the dataset from the above url. The script then reads the test and training sets, merges them (1).  It filters down the mean and std features, and selects only these (2) It merges in the activity names for the activities (3) It then builds up a series of labeled columns to represent single variables from the feature. (4)  It calculates the average of each variable and writes out this data set to `tidy.txt` (5)


Output
------

* Tidy dataset: Tidy Average dataset


Code Book
---------

Code Book: describes the variables, the data, and any transformations or work that you performed to clean up the data

Criteria
--------

> 1. The submitted data set is tidy.
> 2. The Github repo contains the required scripts.
> 3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
> 4. The README that explains the analysis files is clear and understandable.
> 5. The work submitted for this project is the work of the student who submitted it.
