data<- read.csv("preproc.csv")

plot(data$Age,main = "Scatterplot of Age",xlab = "NO of Outcomes",ylab = "Age",col="blue")#Plotting a Scattered Graph
hist(data$Age, main = "Histogram of Age",xlab = "NO of Outcomes",ylab = "Age",col="blue")#Plotting a Histogram
barplot(table(data$Age), main = "Bargraph of Age",xlab = "NO of Outcomes",ylab = "Age",col="blue") #Plotting a Bar Graph
plot(data$Age~data$nature, main = "Scatterplot of Age and Nature",xlab = "Nature",ylab = "Age",col="blue")#Plotting a Scatterred graph with 2 Columns
boxplot(data$personality~data$nature,main = "Boxplot of Nature-personality",xlab = "Nature",ylab = "Personality",col="red")

plot(data$insta~data$impact, type= "b")

hist(data$emotions,xlab = 'emo', col='red')
