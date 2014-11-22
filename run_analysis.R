library(data.table)

doall <- function() {
    data <- readall()
    calcAverages(data)
}

readfile <- function(filename = "train/X_train.txt") {
    dir <- "UCI\ HAR\ Dataset"
    file <-paste(dir, filename, sep = "/")
    read.table(file)
}

readall <- function() {
    activityLabels <- readfile("activity_labels.txt")
    features <- readfile("features.txt")
    
    # read test data
    subjectTest  <- readfile("test/subject_test.txt")
    yTest  <- readfile("test/y_test.txt")
    yTestAct <- mutate(yTest, V1 = activityLabels[V1,2])
    xTest  <- readfile("test/X_test.txt")
    
    testdata <- cbind(subjectTest, yTestAct, xTest)
    
    # read training data
    subjectTrain <- readfile("train/subject_train.txt")
    xTrain <- readfile("train/X_train.txt")
    yTrain <- readfile("train/y_train.txt")
    yTrainAct <- mutate(yTrain, V1 = activityLabels[V1,2])
    
    traindata <- cbind(subjectTrain, yTrainAct, xTrain)
    
    # combine training and test data
    data <- rbind(traindata, testdata)
    
    # change the variable names to descriptive names
    names(data) <- c("subject", "activity", as.character( features[,2]))
    
    # select only the means and std of the measurements
    selectedData <- data[, c(1,2, grep("(mean|std)[(][)]", names(data)))]
    
    # eliminate strange characters in the variable names
    names(selectedData) <- gsub("[()]", "" ,gsub("-","_", names(sel)))
    
    # return the tidy selected data
    selectedData
}

calcAverages <- function(mydata) {
    dataAverages <- aggregate(x=mydata[,3:dim(mydata)[2]], data=mydata, 
                              by = list(mydata$subject, mydata$activity), 
                              FUN = "mean")
    names(dataAverages) <- paste("average_of_",names(x3))
    names(dataAverages)[1]<- names(mydata)[1]
    names(dataAverages)[2]<- names(mydata)[2]
    resultAverages <- arrange(dataAverages, subject, activity)
    write.table(resultAverages, file="averages.txt", row.name=FALSE)
    resultAverages
}