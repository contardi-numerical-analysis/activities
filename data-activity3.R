library(haven)
library(gridExtra)
library(ggplot2)

crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")

crime_75victim <- subset(crime_survey, agegrp7 == 7 & bcsvictim == 1)
View(crime_75victim)

#Unit 5
# 1. Boxplot for 'antisocx'
box_bp <- boxplot(
  crime_survey$antisocx,
  main = "Levels of anti-social behaviour in neighbourhood 'antisocx'",
  ylab = "Antisocial Behaviour Score",
  col = "purple",
  outline = FALSE
)
points(
  rep(1, length(box_bp$out)),
  box_bp$out,
  col = "blue",
  pch = 19
)

# 2. Bar plot for 'antisocx'
bar_victims <- barplot(
  victims_frequency,
  main = "Experience of Crime in the Last 12 Months",
  xlab = "Crime Experience",
  ylab = "Count",
  col = "orange",
  ylim = c(0, max(victims_frequency) * 1.1)
)
text(x = bar_victims, y = victims_frequency, labels = victims_frequency, pos = 3)

# ggplot  for 'antisocx'
ggplot(crime_survey, aes(x = "", y = antisocx)) +
  geom_boxplot(fill = "yellow", outlier.colour = "red") +
  labs(title = "Levels of anti-social behaviour in neighbourhood 'antisocx'",
       x = "",
       y = "Antisocial Behaviour Score") +
  theme_minimal()


#Unit 9
victims_mapped <- ifelse(crime_survey$bcsvictim == 0, "Not Experienced", "Experienced")
victims_factor <- as_factor(victims_mapped)
age_group7 <- as_factor(crime_survey$agegrp7)

crime_tab <- table(victims_factor, age_group7)

crime_prop <- prop.table(crime_tab, 1) * 100
crime_prop_rounded <- round(crime_prop, 2)
print(crime_prop_rounded)
View(crime_prop_rounded)



