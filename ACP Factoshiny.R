# data(decathlon2)
# head(decathlon2)

library(FactoMineR)
library(factoextra)
library(Factoshiny)
library("corrplot")

#data = decathlon2[1:23, 1:10]
data = decathlon2
data

pairs(data[, 1:4], pch = 19)

#matrice_correlation = cor(data)
#corrplot(matrice_correlation, is.corr = FALSE)

#data_scale = as.data.frame(scale(data)) # dataset normalisé
res <- Factoshiny(data)
