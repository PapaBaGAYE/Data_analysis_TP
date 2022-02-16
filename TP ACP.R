# data(decathlon2)
# head(decathlon2)

library(FactoMineR)
library(factoextra)
library("corrplot")

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

var = get_pca_var(res.pca)# Extraction des résultats pour les variables.

ind = get_pca_ind(res.pca)# Extraction des résultats pour les variables.

corrplot(var$cos2, is.corr=TRUE)

fviz_pca_var(res.pca, col.var = "black")
fviz_pca_ind(res.pca, col.var = "black")

fviz_pca_var(res.pca, col.var = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE)
fviz_pca_ind(res.pca, col.ind = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE)

fviz_contrib(res.pca, choice = "var", axes = 1) # variables dimensions 1
fviz_contrib(res.pca, choice = "var", axes = 2) # variables dimensions 2
fviz_contrib(res.pca, choice = "var", axes = c(1, 2)) # variables dimensions 1 et 2

fviz_contrib(res.pca, col.ind = "cos2", choice = "ind", axes = 1) # variables dimensions 1
fviz_contrib(res.pca, col.ind = "cos2", choice = "ind", axes = 2) # variables dimensions 2
fviz_contrib(res.pca, col.ind = "cos2", choice = "ind", axes = c(1, 2)) # induvidus



# options(repos = c(CRAN = "http://cran.rstudio.com"))