# load the data and split to training and testing subset
training.full = read.csv("Course Project/pml-training.csv")

set.seed(100)
library(caret)

inTrain = createDataPartition(training.full$classe, p = 0.6)[[1]]
training.train = training.full[inTrain, ]
training.test = training.full[-inTrain, ]
