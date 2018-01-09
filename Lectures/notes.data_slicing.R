# load packages and data
library(caret)
# create training set indexes with 75% of data
inTrain <- createDataPartition(y=spam$type,p=0.75, list=FALSE)
# subset spam data to training
training <- spam[inTrain,]
# subset spam data (the rest) to test
testing <- spam[-inTrain,]
# dimension of original and training dataset
rbind("original dataset" = dim(spam),"training set" = dim(training))

# create 10 folds for cross validation and return the training set indices
folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain=TRUE)
# structure of the training set indices
str(folds)

# return the test set indices instead # note: returnTrain = FALSE is unnecessary as it is the default behavior
folds.test <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain=FALSE)
str(folds.test)

# return first 10 elements of the first training set
folds[[1]][1:10]

# create 10 resamples
resamples <- createResample(y=spam$type,times=10,list=TRUE)
# structure of the resamples (note some samples are repeated)
str(resamples)
