f_log <- function(DIAS, L, beta, beta0) {
  out <- L/(1+ exp(-beta*(DIAS - beta0)))
  return(out)
}

dias = 365

dados <- read.table("http://leg.ufpr.br/~wagner/data/youtube.txt", header = TRUE)

dados_canal = split(dados, dados$CANAL)
dados_canal1 = dados_canal[[1]]
dados_canal2 = dados_canal[[2]]