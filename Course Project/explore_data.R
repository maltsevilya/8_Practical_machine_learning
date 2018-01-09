# explore data
library(caret)
source("Course Project/load_data.R")

# nearZeroVar(training.full, saveMetrics = TRUE)
preProc <- preProcess(training.train[,-160], method="pca", pcaComp=10)
trainPC <- predict(preProc,training.train[,-160])
# run model on outcome and principle components
modelFit <- train(training.train$classe ~ PC1 + PC2 + PC3 + PC4 +
                      PC5 + PC6 + PC7 + PC8 + PC9 + PC10, method="glm", data=trainPC)
# calculate PCs for test data
testPC <- predict(preProc,training.test[,-160])
# compare results
confusionMatrix(training.test$classe,predict(modelFit,testPC))
