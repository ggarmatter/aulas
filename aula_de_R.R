runif(10) # gera 10 num aleatorios distribuicao uniforme
altura = 100 # o professor fala pra usar <- ao inves de igual, mas funciona
peso = 83

imc = peso/altura^2
save.image() # salva o rdata que tem todas as variaveis

load(".RData") # carrega as var que salvou

args(runif) # mostra argumentos da funcao
runif(10, 6, 7) # 10 valores entre 6 e 7

args(sample)

sample(10:20, 10) # pega uma amostra do range que vc passar. 
sample(10:20, 10, replace=TRUE) # permite reposicao

x = runif(10)
y = runif(10)

?plot #chama a help da funcao plot
plot(x,y)
plot(x,y, pch=2)

search() #mostra os pacotes instalados

library(MASS) #importa o pacote mass
search()
fractions(runif(2))

find("fractions") # busca o pacote fractions

olamundo = function(texto = "Ola mundo"){ # criar função
  writeLines(texto)
}
olamundo("texto laslaldasjdbasidbasda")
olamundo()

runif(30, 0,1)
runif(30, max=(5), min=-5)
runif(max=500, min=10, 30)

?"+"
"+"(2,2)

soma = function(x, y, ...){
  sum(x, y, ...)
}
soma(1, 2, 3, 4, 5)
soma(0, runif(10, 1, 1))

dados = function(x){
  if (class(x) != "numeric"){
    return("poe direito")
  }
  sample(1:6, size=x,replace = TRUE )
}
dados(20)
dados("teste")
