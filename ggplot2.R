# Carrega o conjunto de pacotes do tidyverse.
library(tidyverse)

library(esquisse)     # Shiny para construir gráficos com drag & drop.
library(DataExplorer) # Recursos ágeis de visualização.
library(geobr)
library(Cairo)
#-----------------------------------------------------------------------
# Importar arquivos com dados sobre imóveis a venda em Curitiba.

# Endereço dos dados.
url <- "http://leg.ufpr.br/~walmes/data/TCC_Brasil_Neto/ImoveisWeb-Realty.csv"

# Cria diretório para manter dados se não existir.
if (!dir.exists("./data")) {
  dir.create(path = "./data")
}

# Baixa arquivo para diretório caso não exista.
path <- "./data/ImoveisWeb-Realty.csv"
if (!file.exists(path)) {
  download.file(url, destfile = path)
}

# Importa o arquivo para o ambiente.
imo <- read_csv2(path, locale = locale(encoding = "latin1"))

ggplot(data = imo, mapping = aes(x = price)) + 
  facet_wrap(facets = type ~ .) +
  geom_density(fill = "tomato", alpha = 0.5) +
  scale_x_log10() +
  geom_rug() +
  labs(x = "Preço do imóvel (R$)",
       y = "Densidade",
       title = "Distribuição de preços em Curitiba",
       subtitle = "Escala log")

names(imo)

imo %>% count(advertiser, sort = TRUE)

ggplot(data = imo,
       mapping = aes(x = 1, fill = type)) + # escolhe o que vai usar. type é o tipo do imovel
  geom_bar() + # escolhe otipo do grafico. n faz o menor sentido
  coord_polar(theta = "y") +
  xlim(c(0,1.5)) # faz o "donut

ggplot(data = imo,
       mapping = aes(x= condominium)) +
  geom_histogram() +
  scale_x_log10()

ggplot(data = imo,
       mapping = aes(x= usefulArea, y = price)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()

# funcoes do data explorer
plot_intro(imo)
plot_missing(imo)
plot_histogram(imo)
plot_density(imo)

#plot_qq(imo) # calcula o quanto a distribuição é parecida com a normal. se for acompanha a linha

plot_bar(imo)

plot_correlation(imo) # grafico das correlacoes entre variaveis

plot_boxplot(imo, by="type")

# Dá pra usar essa livraria que faz tudo isso automaticamente
#esquisser(imo)
