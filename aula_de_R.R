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

summary(iris) # sumario de um onjunto de dados
methods(summary) # metodos de summary

x = 32 + 16^2 - 25^3
y = x/345
rm(y) # tira a variavel y da memoria
rm(list=ls()) # tira tudo da memoria

help.search("poisson") # procura que funcao faz poisson
x = rpois(100, 5) # cria uma distribuição de poisson com centro em 5
hist(x)

vetor = c(1, 2, 3, 4, 5)

x = runif(10)
x
typeof(x)
as.integer(x) # muda pra int, mas ele não arredonda
round(x, 3) # arredonda

x = 0.3 + 0.6 - 0.9
x == 0 # erro de ponto flutuante

all.equal(x, 0) # pra comparar ponto flutuante por causa do erro

w = c(5L, "a")
w # transforma tudo em caracter se tiver caracter no vetor

y = c(TRUE, 2)
y # TRUE é transformado em 1, false em 0

z = c(TRUE, FALSE)
z # aqui o type é bool

vetor = c(1 , 2, NA, 6)
vetor

is.na(vetor) # testa pra todos os elementos se é NA

any(is.na(vetor)) # Ve se algum elemento do vetor é NA

rm(list = ls())

vetor = c(54, 0, 17, 94, 12.5, 2, 0.9, 15)
vetor + c(5, 6)
vetor + c(5, 6, 7) # da erro pq nao é divisivel

objeto = c(rep("a", 15), rep("b", 12), rep("c", 8))
objeto

objeto == "b"

sum((objeto == "b")) # conta quantidade de b

set.seed(1)
objeto = runif(100, 0, 1)
objeto

objeto >= 0.5
sum(objeto >= 0.5)
objeto[objeto>= 0.5] # filtro igual pandas

potencias = c(1:50) # ou potencias = 1:50
potencias

2^potencias # calcula as 50 primeiras potencias de 2

potencias^2 # calcula quadrado dos numeros de 1 a 50

2^potencias == potencias^2
sum(2^potencias == potencias^2)

sequencia = seq(from =1, to= 2*pi, by= 0.1)
sin(sequencia)
cos(sequencia)
tan(sequencia)

sin(sequencia)/cos(sequencia) #tangente
# diferenca entre os dois metodos de calculo da tangente
tan(sequencia)- (sin(sequencia)/cos(sequencia)) 
tan(sequencia) == (sin(sequencia)/cos(sequencia)) # quais sao iguais

max(abs(tan(sequencia)- (sin(sequencia)/cos(sequencia)))) # maior diferenca
#imprime o numero sem notacao cientifica
format(max(abs(tan(sequencia)- (sin(sequencia)/cos(sequencia)))), scientific = FALSE)

vetor = 1:10
dim(vetor) = c(2,5)
vetor # vetor virou matriz

dataframe = data.frame(nome = c("joão", "maria", "mariana"),
                       sexo = c("M", "F", "F"),
                       idade = c(60, 61, 26))
dataframe

cont = c(8, 4 ,NA, 9, 6, 1, 7, 9)               
cont[2]
cont[-2] # pega todos menos o na segunda posição
cont[c(2,4)]
cont[2:4]
cont[is.na(cont)]
cont[cont > 6] # pega tudo maior que 6, NA vem junto por algum motivo
cont[cont > 6 & !is.na(cont)]
which(cont > 6) # posicoes dos numeros maiores que 6

names(cont)

names(cont) = letters[1:length(cont)]
cont
cont["b"]

sum(cont) # da NA pq tem NA no vetor
sum(cont, na.rm=TRUE)

cont[is.na(cont)] = 99
cont

mat = matrix(1:9, nrow=3)
mat

mat[3,] # terceira linha
mat[,3] # terceira coluna
mat[,3, drop = FALSE] # nao remove a dimensao

colnames(mat) = letters[1:length(mat[,3])] #da nomes pra colunas
mat

rownames(mat) = LETTERS[1:length(mat[1,])] # da nome pras linhas
mat

mat["A","c"]
