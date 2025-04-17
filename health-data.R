library(haven)

health_data <- read_sav("data/HealthData.sav")
print(names(health_data))
View(health_data)


#Unit 7
getmode <- function(v) {
  v <- v[!is.na(v)] 
  uniqv <- unique(v) 
  uniqv[which.max(tabulate(match(v, uniqv)))] 
}

mean_sbp <- mean(health_data$sbp, na.rm = TRUE) 
median_sbp <- median(health_data$sbp, na.rm = TRUE) 
mode_sbp <- getmode(health_data$sbp)
cat("Systolic Blood Pressure (sbp):\n") 
cat(" Mean :", mean_sbp, "\n") 
cat(" Median:", median_sbp, "\n") 
cat(" Mode :", mode_sbp, "\n\n")

mean_dbp <- mean(health_data$dbp, na.rm = TRUE) 
median_dbp <- median(health_data$dbp, na.rm = TRUE) 
mode_dbp <- getmode(health_data$dbp)
cat("Diastolic Blood Pressure (dbp):\n") 
cat(" Mean :", mean_dbp, "\n")
cat(" Median:", median_dbp, "\n") 
cat(" Mode :", mode_dbp, "\n\n")

mean_income <- mean(health_data$income, na.rm = TRUE) 
median_income <- median(health_data$income, na.rm = TRUE) 
mode_income <- getmode(health_data$income)
cat("Income:\n") 
cat(" Mean :", mean_income, "\n") 
cat(" Median:", median_income, "\n") 
cat(" Mode :", mode_income, "\n\n")

income_fivenum <- fivenum(health_data$income) 
cat("Five-number summary for Income:\n") 
print(income_fivenum)
print(summary(health_data$income))

bp <- boxplot(
  health_data$income, 
  main = "Boxplot of Income with Five-Number Summary", 
  ylab = "Income", 
  col = "lightblue", 
  border = "black"
)
text(x = 1.2, y = income_fivenum, labels = round(income_fivenum, 2), pos = 4, cex = 0.8)

peptic_ulcer <- factor( 
  health_data$pepticulcer, 
  levels = c(0, 1), 
  labels = c("Absent", "Present") 
)

t_test_result <- t.test(sbp ~ pepticulcer, data = health_data) 
cat("\nHypothesis Test Results (Comparing sbp by peptic ulcer status):\n") 
print(t_test_result)

#Unit 8
#Find out the mean, median and mode of ‘age’ variable.
#Find out whether median diastolic blood pressure is same among diabetic and non-diabetic participants.
#Find out whether systolic BP is different across occupational group.

mean_age <- mean(health_data$age, na.rm = TRUE) 
median_age <- median(health_data$age, na.rm = TRUE) 
mode_age <- getmode(health_data$age)

cat("Age Variable Statistics:\n") 
cat("Mean :", mean_age, "\n") 
cat("Median:", median_age, "\n") 
cat("Mode :", mode_age, "\n\n")

diabetes_factor <- factor(health_data$diabetes, levels = c(0, 1), labels = c("Non-diabetic", "Diabetic"))
View(table(diabetes_factor))

wilcox_test <- wilcox.test(dbp ~ diabetes, data = health_data, exact = FALSE) 
cat("Wilcoxon Rank Sum Test for Diastolic Blood Pressure by Diabetes Status:\n") 
print(wilcox_test)

health_data$occupation <- as.factor(health_data$occupation)

anova_result <- aov(sbp ~ occupation, data = health_data) 
cat("ANOVA Results for Systolic Blood Pressure Across Occupational Groups:\n") 
print(summary(anova_result))


#Unit 10
#Means already found

diabetes_factor <- factor(health_data$diabetes, levels = c(0, 1), labels = c("Non-diabetic", "Diabetic"))

wilcox_test <- wilcox.test(dbp ~ diabetes, data = health_data, exact = FALSE) 
cat("Wilcoxon Rank Sum Test for Diastolic Blood Pressure by Diabetes Status:\n") 
print(wilcox_test) 
cat("\n")
