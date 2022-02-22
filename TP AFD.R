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

eig.val <- get_eigenvalue(res.afd)
eig.val

fviz_eig(res.afd, addlabels = TRUE, ylim = c(0, 60))

var = get_famd_var(res.afd)
var
fviz_famd_var(res.afd, col.var = "cos2", , gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel = TRUE)
fviz_contrib(res.afd, col.var = "cos2", choice = "var", axes = 1)
fviz_contrib(res.afd, col.var = "cos2", choice = "var", axes = c(1:4))
fviz_contrib(res.afd, col.var = "cos2", choice = "var", axes = 2)
# ind = get_famd_ind(res.afd)
# ind
# fviz_famd_ind(res.afd)

corrplot(var$cos2, is.corr = TRUE)
quanti.var = get_famd_var(res.afd,"quanti.var")
quanti.var

fviz_famd_var(res.afd,"quanti.var" , repel = "TRUE", col.var = "black")












