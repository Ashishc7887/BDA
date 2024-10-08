#fetch the data

college <- read.csv("c:\\practical\\binary.csv")

head(college)

nrow(college)



install.packages("caTools")    # For Logistic regression

library(caTools)



split <- sample.split(college, SplitRatio = 0.75)

split



training_reg <- subset(college, split == "TRUE")

test_reg <- subset(college, split == "FALSE")



# Training model

fit_MRegressor_model <- lm(formula = admit ~ gre+gpa+rank,
                           
                           data = training_reg)



# Predict test data based on model

predict_reg <- predict(fit_MRegressor_model,
                       
                       newdata = test_reg)

predict_reg 



cdplot(as.factor(admit)~ gpa, data=college)

cdplot(as.factor(admit)~ gre, data=college)

cdplot(as.factor(admit)~ rank, data=college)