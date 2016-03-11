library(survival)

# divide the ovarian dataset into training and test data
train <- ovarian[1:18, ]
test <- ovarian[19:26, ]

# fit a model using survreg function
fit <- survreg(Surv(futime, fustat) ~ rx + ecog.ps, train,
               dist = "weibull", scale = 1)

# predict survival time for the test data using above fit
result <- predict(fit, test)

# calculate zero-one loss
zero_one_loss <- 0
for (i in seq(1, nrow(test))) {
  
  if (test$fustat[i] == 0) {
    
    if (test$futime[i] > result[i]) zero_one_loss <- zero_one_loss + 1
    
  } else {
    
    if (result[i] > 2*test$futime[i] || result[i] < test$futime[i]/2) {
      
      zero_one_loss <- zero_one_loss + 1
      
    }
    
  }
  
}

# displat zero one loss
print(zero_one_loss)
