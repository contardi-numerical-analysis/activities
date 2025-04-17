library(haven)
library(gridExtra)
library(ggplot2)

#Unit 1
crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")
print(names(crime_survey))
print(summary(crime_survey$antisocx))
