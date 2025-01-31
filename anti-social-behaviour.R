library("haven")

crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")

print(summary(crime_survey$antisocx))





