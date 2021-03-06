Activity-Recognition
====================

Submission for Coursera Getting and Cleaning Data class

See data file submitted [AverageBySubjectActivity.txt](https://github.com/walterlsb/Activity-Recognition/blob/master/AverageBySubjectActivity.txt)

Background
----------
The data is available from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and is built from 30 subjects walking, walking up stairs, walking down stairs, sitting, standing and laying down. While they performed the activities, Samsung Galaxy SII cellphone recorded movement data. This submission combines both training and testing data from the repository, pickes out mean and standard deviation measurements and summarizes them by subject and activity.

How the code works
------------------
1.   The script reads the variable labels from features.txt and activity_labels.txt
2.   Read the "x tables" (x_train.txt and x_test.txt)
3.   Apply the labels from activity_labels.txt to the x tables as variable names
4.   The subject tables (subject_train.txt and subject_test.txt) are simply the subjectId associated with the
     x table features. Read the one column tables and append them directly to the x tables. Label the
     feature as SubjectId
5.   The "y tables" list the activity associated with each set of features in the x tables. Read the
     y tables, name the feature actId and append it to the relevant x table.
6.   Now we have a x table that looks something like this:

	|actId|SubjectId|tBodyAcc-mean()-X|...|
	|-----|---------|-----------------|---|
	|1    |12       |0.2160924        |...|

   We will merge the activity_labels data on the actId key to add text activity labels and we get:

	|actId|Activity|SubjectId|tBodyAcc-mean()-X|...|
	|-----|--------|---------|-----------------|---|
	|1    |WALKING |12       |0.2160924        |...|

7.   Now both x tables are complete so we can join them with rbind. 
8.  Because only features labeled *mean* and *standard deviation* are wanted in the final data, the script 
   uses the labels from features.txt and searches it with a regular expression for any labels including *mean* 
   or *std*. These are stored in *vars* which is coerced into a character vector and feature labels *Activity*
    and *SubjectID* are appended to it.
9.  The columns labeled in *vars* are selected into data frame *dataset*. NB. This changes the order of the columns but does keep the column name with the correct data.
10.  To rename the features with descriptive names, the script exports the current feature names into an Excel spreadsheet where the user adds another column with their own names. Then reimport it and the script renames the columns in *dataset*. [See codebook for naming system](https://github.com/walterlsb/Activity-Recognition/blob/master/codebook.md)
11.  Average values grouped by Subject and Activity are calculated using the *aggregate* function which outputs the results to *SummaryData* which looks like this. (You can see that it has been reordered in the aggregation)

	| Group.1 | Group.2 | Activity | SubjectId | tBodyAccXsd       | ... |
	| ------- | ------- | -------- | --------- | ----------------- | --- |
	| LAYING  | 1       | NA       |         1 | -0.928056469      | ... |

12.  Finally we remove columns 2,3 and rename the activity text feature and export to csv

	| Activity| SubjectId | tBodyAccXsd       | ... |
	| ------- | --------- | ----------------- | --- |
	| LAYING  |         1 | -0.928056469      | ... |