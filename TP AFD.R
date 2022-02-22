library("FactoMineR")
library("factoextra")

data(wine)
head(wine)
summary(wine)

# View(wine)
data_wine = wine[, c(1, 16, 22, 29, 28, 30, 31)]
head(data_wine)

#View(data_wine)
summary(data_wine)
pairs(data_wine[, -1], pch = 19, col = c(1,2,3,4,5,6)) 

library("corrplot")
cor_mat = cor(data_wine[, -1])
corrplot(cor_mat, is.corr=TRUE)

## 
res.afd = FAMD(data_wine, graph = FALSE)
print(res.afd)
