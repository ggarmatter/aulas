# x é o ponto que vc quer o resultado, 
# L é o valor maximo da curva
# beta é a inclinacao da curva
# beta0 é o valor de x no ponto de meia vida
f_log <- function(x, L, beta, beta0) {
  out <- L/(1+ exp(-beta*(x - beta0)))
  return(out)
}

dias = 365

dados <- read.table("http://leg.ufpr.br/~wagner/data/youtube.txt", header = TRUE)

dados_canal = split(dados, dados$CANAL)
dados1 = dados_canal[[1]]
dados2 = dados_canal[[2]]

dados1$CUMINSCRITOS = cumsum(dados1$INSCRITOS)/100000
dados2$CUMINSCRITOS = cumsum(dados2$INSCRITOS)/100000

par(mfrow = c(1,2), mar=c(2.6, 3, 1.2, 0.5), mgp = c(1.6, 0.6, 0))
plot(dados1$CUMINSCRITOS ~ dados1$DIAS, xlim = c(0, 1215), ylim = c(0, 25),
     ylab = "Número de inscritos*100000", main = "Canal 1",
     xlab = "Dias", type = "o", cex = 0.1)
abline(v = 850)

plot(dados2$CUMINSCRITOS ~ dados2$DIAS, ylab = "Número de inscritos*100000", main = "Canal 2", 
     xlab = "Dias", ylim = c(0, 50), xlim = c(0, 980), type = "p", cex = 0.1)
abline(v = 607)


#compara a função com os dados e calcula a perda
perda = function(par, y, dia){
  y_estimado = f_log(x=dia, par[1], par[2], par[3])
  erro = sum((y - y_estimado)^2)
  return(erro)
} 
#teste
perda(c(25, 1/130, 600), dados1$CUMINSCRITOS, dados1$DIAS)


resultado = optim(par = c(50, 0.008, 1100), fn = perda, 
             y =dados1$CUMINSCRITOS, dia = dados1$DIAS)
#print(round(resultado$par,5))

resultado2 = optim(par = c(10, 0.008, 600), fn = perda, 
                  y =dados2$CUMINSCRITOS, dia = dados2$DIAS)
#print(round(resultado2$par,5))


len1 = length(dados1$DIAS)+365
len2 = length(dados2$DIAS)+365

#plota os dados originais e resultado
par(mfrow = c(1,2), mar=c(2.6, 3, 1.2, 0.5), mgp = c(1.6, 0.6, 0))
plot(dados1$CUMINSCRITOS ~ dados1$DIAS, xlim = c(0, length(dados1$DIAS)+365), ylim = c(0, 25),
     ylab = "Número de inscritos*100000", main = "Canal 1",
     xlab = "Dias", type = "o", cex = 0.1)
abline(v = 850)
lines(f_log(1:len1, resultado$par[1], resultado$par[2], resultado$par[3]),
      col = "red")
# plota os dados originais e o resultado para o canal 2
plot(dados2$CUMINSCRITOS ~ dados2$DIAS, ylab = "Número de inscritos*100000", main = "Canal 2", 
     xlab = "Dias", ylim = c(0, 50), xlim = c(0, 972), type = "p", cex = 0.1)
abline(v = 607)
lines(f_log(1:len2, resultado2$par[1], resultado2$par[2], resultado2$par[3]),
      col = "red")
resposta_trabalho1 = round(f_log(1:len1, resultado$par[1], resultado$par[2], resultado$par[3])[len1]*100000)
resposta_trabalho2 = round(f_log(1:len2, resultado2$par[1], resultado2$par[2], resultado2$par[3])[len2]*100000)

print(paste0("Numero de inscritos previsto para daqui 1 ano para o canal ",dados1[1,4],": " , resposta_trabalho1))
print(paste0("Numero de inscritos previsto para daqui 1 ano para o canal ",dados2[1,4],": " , resposta_trabalho2))
