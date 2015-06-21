==================================================================
Tidying of the Human Activity Recognition Using Smartphones Dataset
Version 1.0

==================================================================
The script automates the following actions
1. Merges the X_train.txt and X_test.txt datasets from the HAR dataset.
2. Adds column headers to the dataset using those from the features.txt and removes the periods which R replaces invalid characters with
3. Joins the subject and activity data
4. Replaces the activity codes with the activity labels from activity_labels.txt
5. Extracts only mean (but not meanFreq) and standard deviation variables
6. Groups the dataset by Subject and Activity, then aggregates the data by calculating the mean of all variables

This script assumes that the HAR dataset has been downloaded and extracted.
It also assumes that the working directory has been set in R to be the base directory of dataset (where its README.txt file is located). 

The package includes the following files:
=========================================

- 'README.md': This file - an explanation of the package and file contents.

- 'CodeBook.md': A listing and description of the fields in the tidy.txt dataset.

- 'run_analysis.R': The script which merges the X_train.txt and X_test.txt datasets from the HAR dataset and performs a subsequent tidying and aggregation of data listed above.

- 'tidy.txt': The dataset which the script outputs.

The dataset files are not part of this package and need to be downloaded and unzipped.

License:
========
Use of this script must be acknowledged by crediting the author. This script is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Chris Lathrop, 2015

==================================================================
Dataset from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
