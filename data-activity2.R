library(haven)
library(gridExtra)
library(ggplot2)

crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")

victims_mapped <- ifelse(crime_survey$bcsvictim == 0, "Not Experienced", "Experienced")
victims_factor <- as_factor(victims_mapped)
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