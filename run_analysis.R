library(reshape2)

# Download the dataset from the source

filename <- "source_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read the feature and activity files into a dataframe

features = read.table('./UCI HAR Dataset/features.txt',header=FALSE) 
activity = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)
colnames(features) = c('featureId','featureType')
colnames(activity) = c('activityId','activityType')

# Read test and training data and merge them together

Xtest = read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)
ytest = read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)
subjectTest = read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)
testdata <- cbind(subjectTest, ytest, Xtest)

Xtrain = read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
ytrain = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
traindata <- cbind(subjectTrain, ytrain, Xtrain)

combinedData <- rbind(traindata, testdata)
columnX <- features[,2]
colnames(combinedData) <- c("subjectId", "activityId", as.character(columnX))

# Pull only columns with mean and standard deviation data

filterData = combinedData[,grepl(".*[mM]ean.*|.*std.*|activityId|subjectId", names(combinedData))]

# Rename the columns to desciptive values

names(filterData) = gsub('\\(|\\)',"",names(filterData), perl = TRUE)
names(filterData) = gsub('Acc-',"Acceleration-",names(filterData))
names(filterData) = gsub('Mag',"Magnitude",names(filterData))
names(filterData) = gsub('^t',"TimeDomain",names(filterData))
names(filterData) = gsub('^f',"FrequencyDomain",names(filterData))
names(filterData) = gsub('\\.mean',"Mean",names(filterData))
names(filterData) = gsub('\\.std',"StandardDeviation",names(filterData))
names(filterData) = gsub('Freq\\.',"Frequency.",names(filterData))
names(filterData) = gsub('Freq$',"Frequency",names(filterData))

# Add the activity descriptive field to the data

allData <- merge(filterData, activity, by.x='activityId',by.y = 'activityId')
dropcolumns <- c('activityId')
allData <- allData[,!names(allData) %in% dropcolumns]

# Summarize the data on activity and subject and average of all variables...

meltdata <- melt(allData, id = c("activityType","subjectId"))
castdata <- dcast(meltdata, activityType + subjectId ~ variable, mean)

# Write the tidy data into a new dataset..

write.table(castdata, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)