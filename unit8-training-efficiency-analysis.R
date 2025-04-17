vendor1 <- c(45, 29, 56, 52, 45, 45, 41)
vendor2 <- c(61, 53, 41, 58, 53, 47, 44)
vendor3 <- c(35, 21, 33, 27, 22, 26, 30)

mean_v1 <- mean(vendor1)
mean_v2 <- mean(vendor2)
mean_v3 <- mean(vendor3)

cat("Vendor 1 mean:", mean_v1, "\n")
cat("Vendor 2 mean:", mean_v2, "\n")
cat("Vendor 3 mean:", mean_v3, "\n")

scores <- c(vendor1, vendor2, vendor3)
groups <- factor(rep(c("Vendor1", "Vendor2", "Vendor3"), each = 7))

summary(scores)

anova_result <- aov(scores ~ groups)
summary(anova_result)
p_value <- summary(anova_result)[[1]]["groups", "Pr(>F)"]

#P Value
print(p_value)

TukeyHSD(anova_result)
