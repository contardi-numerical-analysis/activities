library(haven)

health_data <- read_sav("data/HealthData.sav")

names(health_data)
model <- lm(dbp ~ sbp, data = health_data)

summary(model)

#RESULTS

#Call:
#  lm(formula = dbp ~ sbp, data = health_data)

#Residuals:
#  Min       1Q   Median       3Q      Max 
#-16.7958  -3.9366   0.1804   3.6685  19.2042 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  19.4068     2.7931   6.948 4.67e-11 ***
#  sbp           0.4960     0.0216  22.961  < 2e-16 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 6.264 on 208 degrees of freedom
#Multiple R-squared:  0.7171,	Adjusted R-squared:  0.7157 
#F-statistic: 527.2 on 1 and 208 DF,  p-value: < 2.2e-16
