# Load required libraries
library(haven)
library(dplyr)

# Load the dataset
crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")

# Recode 'bcsvictim' for clarity
crime_survey$victim_status <- ifelse(crime_survey$bcsvictim == 1, "Victim", "Not Victim")

# Crosstab
crosstab <- table(crime_survey$victim_status, crime_survey$agegrp7)

# Row percentages
row_percent <- prop.table(crosstab, margin = 1) * 100
row_percent <- round(row_percent, 2)

# Print the crosstab with row percentages
print(row_percent)
View(row_percent)
