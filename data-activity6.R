library(haven)
library(dplyr)

# Load the data
health_data <- read_sav("data/HealthData.sav")


# Mean and Median
mean_age <- mean(health_data$age, na.rm = TRUE)
median_age <- median(health_data$age, na.rm = TRUE)

# Mode function
get_mode <- function(v) {
  uniqv <- na.omit(unique(v))
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_age <- get_mode(health_data$age)

# Output
cat("Mean age:", mean_age, "\n")
cat("Median age:", median_age, "\n")
cat("Mode age:", mode_age, "\n")

# Mann-Whitney U test (Wilcoxon rank-sum test)
wilcox.test(dbp ~ diabetes, data = health_data)

kruskal.test(sbp ~ occupation, data = health_data)
