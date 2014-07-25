
## 1 - read the variable labels and activity labels
labels<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")



#########################################
## 2,3 - x-tables
## read the x_train table and label the columns with meaningful names
x_train<-read.table("./train/x_train.txt")
names(x_train)<-labels[,2]

## read the x_test table and label the columns with meaningful names
x_test<-read.table("./test/x_test.txt")
names(x_test)<-labels[,2]
#########################################




#########################################
## 4 - subject tables
## subject tables are a list of subjects one for each record in the x tables
## append column at front of data table with subject ID
##
## read the subject Ids
subject_train<-read.table("./train/subject_train.txt")
subject_test<-read.table("./test/subject_test.txt")

## append the subjectId to the x tables and label the variable
x_test<-cbind(subject_test,x_test)
x_train<-cbind(subject_train,x_train)
names(x_test)[1]<-"SubjectID"
names(x_train)[1]<-"SubjectID"


#########################################
## 5 - y tables
## y tables hold an id to activities
## First copy the activityIds to the x tables

y_test<-read.table("./test/y_test.txt")
y_train<-read.table("./train/y_train.txt")


##  name the column and add it to the x table
names(y_test)[1]<-"actId"
names(y_train)[1]<-"actId"

x_test<-cbind("actId"=y_test,x_test)
x_train<-cbind("actId"=y_train,x_train)


## 6 - merge the activity labels
names(activity_labels)<-c("actId","Activity")

x_test<-merge(activity_labels,x_test,x.lab="actId",y.lab="actId")
x_train<-merge(activity_labels,x_train,x.lab="actId",y.lab="actId")


## 7 -  join the two data sets together

dataset<-rbind(x_train,x_test)

## 8 - subset only the observations we want
## indentify the variables including mean and std in their labels
meanVars<-labels[grep("mean",labels$V2),]
stdVars<-labels[grep("std",labels$V2),]
vars<-rbind(stdVars,meanVars)[,2]
vars<-as.character(vars)
vars<-c("Activity","SubjectID",vars)

## 9 - subset the dataset with the variables
dataset<-dataset[vars]

## 10 - Rename the variables with "descriptive" names.
## export current variable names into Excel, edit them and resave and reload
library(xlsx)
write.xlsx(vars,"vars.xlsx")
## edit the excel file
newvars<-read.xlsx("vars.xlsx",1)
names(dataset)<-newvars[,3]

##############################################
## 11 - calculate mean for each combination of Activity and Subject
SummaryData<-aggregate(dataset,list(dataset$Activity,dataset$SubjectID),FUN=mean)

## clean up the data to return (clean out a few columns)
SummaryData<-SummaryData[,c(1,4:83)]
names(SummaryData)[1]<-"Activity"
write.csv(SummaryData,"AverageBySubjectActivity.csv")
