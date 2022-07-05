## BI MINI PROJECT GROUP 20

library(rpart) # Decision tree
library(rpart.plot) # Plotting decision tree
library(caret) # Accuracy estimation
library(Metrics) # For different model evaluation metrics
library(party)


data<- read.csv("preproc.csv")
print(head(data))

set.seed(123)
index <- sample(2, nrow(data), prob = c(0.8, 0.2), replace = TRUE)
Dt_train <- data[index==1, ] 
Dt_test <- data[index == 2, ] 

print(dim(Dt_train))
print(dim(Dt_test))

prop.table(table(Dt_train$fb))
prop.table(table(data$fb))


# Train a decision tree model
model <- rpart(formula =personality~., 
                        data = Dt_train, 
                        method = "class")

rpart.plot(model,extra=106)


class_predicted <- predict(object = model,newdata = Dt_test,type = "class")

#confusion Matrix(data = class_predicted,reference = Diabetes_test$Class)

accuracy(actual = class_predicted,predicted = Dt_test$insta)



