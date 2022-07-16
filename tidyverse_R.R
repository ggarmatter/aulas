# mais infos: http://leg.ufpr.br/~walmes/ensino/dsbd-linprog/

library(tidyverse)

ls("package:readr") %>%
  str_subset("^read_")

ls("package:readr") %>%
  str_subset("^write_")

url <- "http://leg.ufpr.br/~walmes/data/euro_football_players.txt"

# Importa a tabela de dados.
tb <- read_tsv(file = url,
               comment = "#")
head(tb, n = 6)

class(tb)
methods(class = "tbl")
methods(class = "tbl_df")
methods(class = "data.frame")

#cria dfs por coluna
df1 <- tibble(matricula = c(256, 487, 965, 125, 458, 874, 963),
              nome = c("João", "Vanessa", "Tiago", "Luana", "Gisele",
                       "Pedro", "André"),
              curso = c("Mat", "Mat", "Est", "Est", "Est", "Mat", "Est"),
              prova1 = c(80, 75, 95, 70, 45, 55, 30),
              prova2 = c(90, 75, 80, 85, 50, 75, NA),
              prova3 = c(80, 75, 75, 50, NA, 90, 30),
              faltas = c(4, 4, 0, 8, 16, 0, 20))
df2 <- tibble(matricula = c(505, 658, 713),
              nome = c("Bia", "Carlos", "Cris"),
              curso = c("Eng", "Eng", "Eng"),
              prova1 = c(65, 75, 75),
              prova2 = c(85, 80, 90),
              faltas = c(0, 0, 2))

# cria df por linha
df_extra <- tribble(
  ~mat,     ~nome, ~idade, ~bolsista,
  256,  'João'  ,     18,       "S",
  965,  'Tiago' ,     18,       "N",
  285,  'Tiago' ,     22,       "N",
  125,  'Luana' ,     21,       "S",
  874,  'Pedro' ,     19,       "N",
  321,  'Mia'   ,     18,       "N",
  669,  'Luana' ,     19,       "S",
  967,  'André' ,     20,       "N",
)
# ordena por matricula
arrange(df_extra, mat)
# ou
df_extra %>% arrange(mat)

# selecao de colunas 
# recomendado usar %>%, que é pra usar df1 como primeiro argumento da função
df1 %>% select(nome, prova1, prova2, prova3)
# ou
df1[, c("nome", "prova1", "prova2", "prova3")]

# selecao de linhas
df1[1, ]
df1[3:5, ]
df1[-(3:5), ]
df1[c(3:4, 1:2), ]
# ou
df1 %>% slice(1)
df1 %>% slice(3:5)
df1 %>% slice(-(3:5))
df1 %>% slice(c(3:4, 1:2))

# filtro
df1[df1$curso == "Est",] # precisa dessa virgula no fim
df1[df1$faltas == 0,]
# ou
df1 %>% filter(curso == "Est")
# ou
df1 %>% dplyr::filter(curso == "Est")

# renomear colunas
df1 %>% rename("mat," = "matricula", "fl" = "faltas")
df1

# tira nulos
df1 = df1 %>% replace_na(replace = list(prova1 = 0, prova2 = 0, prova3= 0))

# criação
df1$media = with(df1, (prova1 + prova2 + prova3)/3)
df1

df1$media = df1 %>% select(prova1:prova3) %>% apply(MARGIN = 1, mean)
df1

# selecao
df1$media
df1[["media"]]
df1["media"]

# cria coluna com aprovacao ou reprovacao ou prova final

df1 %>% mutate((df1$result = case_when(df1$media > 70 ~ "aprovado",
                                       df1$media < 70 & df1$media > 40 ~ "exame",
                                       df1$media < 40 ~ "reprovado")))

# agrupa por curso e calcula media e desv pad
df1 %>%
  group_by(curso) %>%
  summarise_at(vars(prova1:prova3, faltas),
               c("mean", "sd"),
               na.rm = TRUE)

# agrupa por curso, trnasforma as diferentes colunas em linhas
# seleciona colunas
# transforma colunas em linhas com nome das colunas "variavel" e "valor", menos pra curso
# agrupa por coluna e variavel
# calcula o resultado da media e desv padrao
df1 %>%
  select(curso, prova1:prova3, faltas) %>%
  gather(key = "variavel", value = "valor", -curso) %>%
  group_by(curso, variavel) %>%
  summarise_at("valor",
               c("mean", "sd"),
               na.rm = TRUE)

url = "http://leg.ufpr.br/~walmes/data/Cadastro-Central-de-Empresas-PR.csv"

tb = read_csv(url, comment="#" )
glimpse(tb)