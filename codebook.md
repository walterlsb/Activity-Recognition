Codebook
========

Background
----------
The data is available from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and is built from 30 subjects walking, walking up stairs, walking down stairs, sitting, standing and laying down. While they performed the activities, Samsung Galaxy SII cellphone recorded movement data. This submission combines both training and testing data from the repository, pickes out mean and standard deviation measurements and summarizes them by subject and activity.

Feature description
--------------------

In an effort to make the data more easy to read I changed the existing column names to a camel case type of name and made them more structured.

1. Each starts with a **t** for *time* or an **f** for *frequency*.
2. Next, each specifies whether the measurement relates to *body* or *gravity*
3. Next, each specifies whether the measurement is an *Acceleration*, or *Gyro*
4. Next, if the measurement relates to a *Jerk*, *Mag*, *Freq* or a combination
5. If there is a direction, this is capitalized next as *X*, *Y*, *Z*
6.Finally if the measurement is a *mean* or *standard deviation*

Finally, for complete clarity, see my column names mapped to the originals below.


Mapping my column names to original column names
------------------------------------------------

|    | Old                             | New                   |
|----|---------------------------------|-----------------------|
| 4  | tBodyAcc-std()-X                | tBodyAccXsd           |
| 5  | tBodyAcc-std()-Y                | tBodyAccYsd           |
| 6  | tBodyAcc-std()-Z                | tBodyAccZsd           |
| 7  | tGravityAcc-std()-X             | tGravityAccXsd        |
| 8  | tGravityAcc-std()-Y             | tGravityAccYsd        |
| 9  | tGravityAcc-std()-Z             | tGravityAccZsd        |
| 10 | tBodyAccJerk-std()-X            | tBodyAccJerkXsd       |
| 11 | tBodyAccJerk-std()-Y            | tBodyAccJerkYsd       |
| 12 | tBodyAccJerk-std()-Z            | tBodyAccJerkZsd       |
| 13 | tBodyGyro-std()-X               | tBodyGyroXsd          |
| 14 | tBodyGyro-std()-Y               | tBodyGyroYsd          |
| 15 | tBodyGyro-std()-Z               | tBodyGyroZsd          |
| 16 | tBodyGyroJerk-std()-X           | tBodyGyroJerkXsd      |
| 17 | tBodyGyroJerk-std()-Y           | tBodyGyroJerkYsd      |
| 18 | tBodyGyroJerk-std()-Z           | tBodyGyroJerkZsd      |
| 19 | tBodyAccMag-std()               | tBodyAccMagsd         |
| 20 | tGravityAccMag-std()            | tGravityAccMagsd      |
| 21 | tBodyAccJerkMag-std()           | tBodyAccJerkMagsd     |
| 22 | tBodyGyroMag-std()              | tBodyGyroMagsd        |
| 23 | tBodyGyroJerkMag-std()          | tBodyGyroJerkMagsd    |
| 24 | fBodyAcc-std()-X                | fBodyAccXsd           |
| 25 | fBodyAcc-std()-Y                | fBodyAccYsd           |
| 26 | fBodyAcc-std()-Z                | fBodyAccZsd           |
| 27 | fBodyAccJerk-std()-X            | fBodyAccJerkXsd       |
| 28 | fBodyAccJerk-std()-Y            | fBodyAccJerkYsd       |
| 29 | fBodyAccJerk-std()-Z            | fBodyAccJerkZsd       |
| 30 | fBodyGyro-std()-X               | fBodyGyroXsd          |
| 31 | fBodyGyro-std()-Y               | fBodyGyroYsd          |
| 32 | fBodyGyro-std()-Z               | fBodyGyroZsd          |
| 33 | fBodyAccMag-std()               | fBodyAccMagsd         |
| 34 | fBodyBodyAccJerkMag-std()       | fBodyAccJerkMagsd     |
| 35 | fBodyBodyGyroMag-std()          | fBodyGyroMagsd        |
| 36 | fBodyBodyGyroJerkMag-std()      | fBodyGyroJerkMagsd    |
| 37 | tBodyAcc-mean()-X               | tBodyAccXm            |
| 38 | tBodyAcc-mean()-Y               | tBodyAccYm            |
| 39 | tBodyAcc-mean()-Z               | tBodyAccZm            |
| 40 | tGravityAcc-mean()-X            | tGravityAccXm         |
| 41 | tGravityAcc-mean()-Y            | tGravityAccYm         |
| 42 | tGravityAcc-mean()-Z            | tGravityAccZm         |
| 43 | tBodyAccJerk-mean()-X           | tBodyAccJerkXm        |
| 44 | tBodyAccJerk-mean()-Y           | tBodyAccJerkYm        |
| 45 | tBodyAccJerk-mean()-Z           | tBodyAccJerkZm        |
| 46 | tBodyGyro-mean()-X              | tBodyGyroXm           |
| 47 | tBodyGyro-mean()-Y              | tBodyGyroYm           |
| 48 | tBodyGyro-mean()-Z              | tBodyGyroZm           |
| 49 | tBodyGyroJerk-mean()-X          | tBodyGyroJerkXm       |
| 50 | tBodyGyroJerk-mean()-Y          | tBodyGyroJerkYm       |
| 51 | tBodyGyroJerk-mean()-Z          | tBodyGyroJerkZm       |
| 52 | tBodyAccMag-mean()              | tBodyAccMagm          |
| 53 | tGravityAccMag-mean()           | tGravityAccMagm       |
| 54 | tBodyAccJerkMag-mean()          | tBodyAccJerkMagm      |
| 55 | tBodyGyroMag-mean()             | tBodyGyroMagm         |
| 56 | tBodyGyroJerkMag-mean()         | tBodyGyroJerkMagm     |
| 57 | fBodyAcc-mean()-X               | fBodyAccXm            |
| 58 | fBodyAcc-mean()-Y               | fBodyAccYm            |
| 59 | fBodyAcc-mean()-Z               | fBodyAccZm            |
| 60 | fBodyAcc-meanFreq()-X           | fBodyAccFreqXm        |
| 61 | fBodyAcc-meanFreq()-Y           | fBodyAccFreqYm        |
| 62 | fBodyAcc-meanFreq()-Z           | fBodyAccFreqZm        |
| 63 | fBodyAccJerk-mean()-X           | fBodyAccJerkXm        |
| 64 | fBodyAccJerk-mean()-Y           | fBodyAccJerkYm        |
| 65 | fBodyAccJerk-mean()-Z           | fBodyAccJerkZm        |
| 66 | fBodyAccJerk-meanFreq()-X       | fBodyAccJerkFreqXm    |
| 67 | fBodyAccJerk-meanFreq()-Y       | fBodyAccJerkFreqYm    |
| 68 | fBodyAccJerk-meanFreq()-Z       | fBodyAccJerkFreqZm    |
| 69 | fBodyGyro-mean()-X              | fBodyGyroXm           |
| 70 | fBodyGyro-mean()-Y              | fBodyGyroYm           |
| 71 | fBodyGyro-mean()-Z              | fBodyGyroZm           |
| 72 | fBodyGyro-meanFreq()-X          | fBodyGyroFreqXm       |
| 73 | fBodyGyro-meanFreq()-Y          | fBodyGyroFreqYm       |
| 74 | fBodyGyro-meanFreq()-Z          | fBodyGyroFreqZm       |
| 75 | fBodyAccMag-mean()              | fBodyAccMagm          |
| 76 | fBodyAccMag-meanFreq()          | fBodyAccMagFreqm      |
| 77 | fBodyBodyAccJerkMag-mean()      | fBodyAccJerkMagm      |
| 78 | fBodyBodyAccJerkMag-meanFreq()  | fBodyAccJerkMagFreqm  |
| 79 | fBodyBodyGyroMag-mean()         | fBodyGyroMagm         |
| 80 | fBodyBodyGyroMag-meanFreq()     | fBodyGyroMagFreqm     |
| 81 | fBodyBodyGyroJerkMag-mean()     | fBodyGyroJerkMagm     |
| 82 | fBodyBodyGyroJerkMag-meanFreq() | fBodyGyroJerkMagFreqm |