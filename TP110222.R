# data(decathlon2)
# head(decathlon2)
data = decathlon2[1:23, 1:10]
data

pairs(data[, 1:4], pch = 19)

matrice_correlation = cor(data)
corrplot(matrice_correlation, is.corr = FALSE)

data_scale = as.data.frame(scale(data)) # dataset normalisé
res.pca <- PCA(data_scale, graph = FALSE)
print(res.pca)

mean(data_scale$X100m) # moyenne centrée
sd(data_scale$X100m) # ecart type reduit

eig.val <- get_eigenvalue(res.pca)
round(eig.val, 2)

fviz_eig(res.pca, addlabels = TRUE, ylim=c(0, 50))


