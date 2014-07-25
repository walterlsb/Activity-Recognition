
## read the variable labels and activity labels
labels<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")



#########################################
## x-tables
## read the x_train table and label the columns with meaningful names
x_train<-read.table("./train/x_train.txt")
names(x_train)<-labels[,2]

## read the x_test table and label the columns with meaningful names
x_test<-read.table("./test/x_test.txt")
names(x_test)<-labels[,2]
#########################################




#########################################
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
## y tables hold an id to activities
## First merge the y tables with text labels

y_test<-read.table("./test/y_test.txt")
y_train<-read.table("./train/y_train.txt")


## merge the activity with the y tables to give a list of activity observations to add to the x_test datafile
names(y_test)[1]<-"actId"
names(y_train)[1]<-"actId"
names(activity_labels)<-c("actId","Activity")

x_test<-cbind("actId"=y_test,x_test)
x_train<-cbind("actId"=y_train,x_train)

x_test<-merge(activity_labels,x_test,x.lab="actId",y.lab="actId")
x_train<-merge(activity_labels,x_train,x.lab="actId",y.lab="actId")


## label and join the two data sets together
x_train<-cbind("Dataset"="training",x_train)
x_test<-cbind("Dataset"="test",x_test)

dataset<-rbind(x_train,x_test)

## indentify the variables including mean and std in their labels
meanVars<-labels[grep("mean",labels$V2),]
stdVars<-labels[grep("std",labels$V2),]
vars<-rbind(stdVars,meanVars)[,2]
vars<-as.character(vars)
vars<-c("Dataset","Activity","SubjectID",vars)

## subset the dataset with the variables
dataset<-dataset[vars]

## Rename the variables with "descriptive" names.
## export current variable names into Excel, edit them and resave and reload
library(xlsx)
write.xlsx(vars,"vars.xlsx")
## edit the excel file
newvars<-read.xlsx("vars.xlsx",1)
> names(dataset)<-newvars[,3]

##############################################
## calculate mean for each combination of Activity and Subject
SummaryData<-aggregate(dataset,list(dataset$Activity,dataset$SubjectID),FUN=mean)

## clean up the data to return (clean out a few columns)
SummaryData<-SummaryData[,c(1,5:84)]
