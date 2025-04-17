library(haven)
library(dplyr)

# Load the data
health_data <- read_sav("data/HealthData.sav")

# Mean and Median
mean_sbp <- mean(health_data$sbp, na.rm = TRUE)
median_sbp <- median(health_data$sbp, na.rm = TRUE)

mean_dbp <- mean(health_data$dbp, na.rm = TRUE)
median_dbp <- median(health_data$dbp, na.rm = TRUE)

mean_income <- mean(health_data$income, na.rm = TRUE)
median_income <- median(health_data$income, na.rm = TRUE)

# Mode Function
get_mode <- function(x) {
  uniq_x <- na.omit(unique(x))
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

mode_sbp <- get_mode(health_data$sbp)
mode_dbp <- get_mode(health_data$dbp)
mode_income <- get_mode(health_data$income)

# Output results
cat("Mean SBP:", mean_sbp, "\nMedian SBP:", median_sbp, "\nMode SBP:", mode_sbp, "\n\n")
cat("Mean DBP:", mean_dbp, "\nMedian DBP:", median_dbp, "\nMode DBP:", mode_dbp, "\n\n")
cat("Mean Income:", mean_income, "\nMedian Income:", median_income, "\nMode Income:", mode_income, "\n")


summary(health_data$income)
income_fivenum <- fivenum(health_data$income)

# Boxplot
boxplot(
  health_data$income,
  main = "Boxplot of Income",
  ylab = "Income",
  col = "lightblue"
)
text(x = 1.2, y = income_fivenum, labels = round(income_fivenum, 2), pos = 4, cex = 0.8)

# Check normality
# If p > 0.05, assume normal
shapiro.test(health_data$sbp)  
t.test(sbp ~ pepticulcer, data = health_data)

wilcox.test(sbp ~ pepticulcer, data = health_data)
