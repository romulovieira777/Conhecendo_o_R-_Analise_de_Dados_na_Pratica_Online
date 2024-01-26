# Instalando o pacote #
install.packages("dplyr")

# Chamando a biblioteca #
library(dplyr)

# Aplicacao #
exemplo <- data.frame(
  "nome" = c("Joana", "Maria", "João", "Pedro", "José"),
  "idade" = c(21, 25, 28, 34, 18),
  "qtd_livros" = c(5, 1, 2, 1, 3),
  "faculdade" = c("Engenharia", "Engenharia", "Direito", "Enfermagem", "Engenharia")
)

# Filtrando linhas #
engenharia <- exemplo %>%
  filter(faculdade == "Engenharia")

exemplo %>%
  filter(faculdade == "Enfermagem")

# Salvando em outra variavel #
enfermagem <- exemplo %>%
  filter(faculdade == "Enfermagem")

# operacoes matematicas #
exemplo %>%
  mutate(media_idade = mean(idade))

exemplo %>%
  filter(faculdade == "Engenharia") %>%
  mutate(media_idade = mean(idade)) %>%
  select(nome, faculdade, idade, media_idade)

exemplo %>%
  group_by(faculdade) %>%
  tally()
