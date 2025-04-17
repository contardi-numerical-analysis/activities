library(ggplot2)

crime_survey <- read_sav("data/crime-survey-csew1314teachingopen.sav")

df <- data.frame(antisocx = crime_survey$antisocx)

ggplot(df, aes(y = antisocx)) +
  geom_boxplot(fill = "yellow", outlier.colour = "red", outlier.shape = 16, outlier.size = 2) +
  labs(
    title = "Levels of anti-social behaviour in neighbourhood ‘antisocx’",
    y = "Anti-social Behaviour Score"
  ) +
  theme_minimal()


df_victim <- data.frame(
  VictimStatus = ifelse(crime_survey$bcsvictim == 1, "Experienced", "Not Experienced")
)

ggplot(df_victim, aes(x = VictimStatus)) +
  geom_bar(fill = "orange") +
  labs(
    title = "Experience of Crime in the Last 12 Months",
    x = "Crime Experience",
    y = "Number of Respondents"
  ) +
  theme_minimal()