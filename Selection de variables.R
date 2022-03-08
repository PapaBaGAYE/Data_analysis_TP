#install.packages(c("randomForest", "MASS", "VSURF"))
library("MASS")
library("randomForest")
library("VSURF")

data(swiss)
head(swiss)
summary(swiss)

pairs(swiss, pch = 19)

library("corrplot")
cor_mat = cor(swiss)
corrplot(cor_mat, is.corr=TRUE)

LRT_dev = function(mod1, mod2){
  1-pchisq(deviance(mod1)-deviance(mod2), df.residual(mod1)-df.residual(mod2))
}
model0 = lm(Fertility ~ 1, data = swiss)
model1 = lm(Fertility ~ 1, Infant.Mortality, data = swiss)
LRT_dev(model0, model1)

model2 = lm(Fertility ~ 1, Infant.Mortality + Catholic, data = swiss)
LRT_dev(model1, model2)


