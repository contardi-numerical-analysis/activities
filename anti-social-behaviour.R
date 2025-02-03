library(haven)
library(gridExtra)

#Unit 1
crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")
print(summary(crime_survey$antisocx))

#Unit 2
victims_factor <- factor(crime_survey$bcsvictim, levels = c(0, 1), labels = c("Not Experienced", "Experienced"))
victims_frequency <- table(victims_factor)
print(victims_frequency)

bp <- barplot(
  victims_frequency,
  main = "Frequency of Responses",
  xlab = "Experienced Any Crime",
  ylab = "Count",
  col = "skyblue",
  ylim = c(0, max(victims_frequency) * 1.1)
)
text(x = bp, y = victims_frequency, labels = victims_frequency, pos = 3)

