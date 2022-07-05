install.packages("e1071")
install.packages("caTools")
install.packages("class")

# Loading package
library(e1071)
library(caTools)
library(class)

data<- read.csv("preproc.csv")

split <- sample.split(data, SplitRatio = 0.7)
train_cl <- subset(data, split == "TRUE")
test_cl <- subset(data, split == "FALSE")

train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])

classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$gender,
                      k = 1)

classifier_knn

cm <- table(test_cl$gender, classifier_knn)
cm

# Calculate out of Sample error
misClassError <- mean(classifier_knn != test_cl$gender)
print(paste('Accuracy =', 1-misClassError))

# K = 3
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$gender,
                      k = 3)
misClassError <- mean(classifier_knn != test_cl$gender)
print(paste('Accuracy =', 1-misClassError))
