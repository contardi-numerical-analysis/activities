library(haven)
library(ggplot2)

# Load the SPSS file
health_data <- read_sav("data/HealthData.sav")

# Calculate Pearson correlation
correlation <- cor(health_data$sbp, health_data$dbp, use = "complete.obs")
print(paste("Correlation between systolic and diastolic BP:", round(correlation, 3)))

# Calculate Pearson correlation
correlation <- cor(health_data$sbp, health_data$dbp, use = "complete.obs")
print(paste("Correlation between systolic and diastolic BP:", round(correlation, 3)))

# Using plot
plot(
  health_data$sbp,
  health_data$dbp,
  main = "Scatter Plot of Systolic vs Diastolic Blood Pressure",
  xlab = "Systolic BP (sbp)",
  ylab = "Diastolic BP (dbp)",
  pch = 19,
  col = "blue"
)

# Using ggplot2
ggplot(health_data, aes(x = sbp, y = dbp)) +
  geom_point(color = "blue") +
  ggtitle("Scatter Plot of Systolic vs Diastolic Blood Pressure") +
  xlab("Systolic BP (sbp)") +
  ylab("Diastolic BP (dbp)") +
  theme_minimal()