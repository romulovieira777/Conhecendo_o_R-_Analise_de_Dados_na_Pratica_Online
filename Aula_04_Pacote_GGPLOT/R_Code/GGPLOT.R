# Instalar o pacote GGPLOT #
install.packages("ggplot2")

# Instalando o pacite Tidyverse #
install.packages("tidyverse")

# https://www.r-graph-gallery.com/ggplot2-package.html #

# Carregando pacote no ambiente R #
library(ggplot2)
library(tidyverse)
library(car)

# Quantidade de alunos em cada curso de faculdade #
exemplo <- data.frame(
  "nome" = c("Joana", "Maria", "Joao", "Pedro", "Jose"),
  "idade" = c(21, 25, 28, 34, 18),
  "qtd_livros" = c(5, 1, 2, 1, 3),
  "faculdade" = c("Engenharia", "Engenharia", "Direito", "Enfermagem", "Engenharia"),
  stringsAsFactors = FALSE
)

# Histograma - Mesma cor #
ggplot(exemplo, aes(x = faculdade)) +
  geom_bar(stat = "count", fill = "#FF6666") +
  xlab("Cursos") +
  ylab("Quantidade total de alunos")

# Histograma - Cores para cada classe (automatico) #
ggplot(exemplo, aes(x = faculdade, fill = faculdade)) +
  geom_bar(stat = "count") +
  xlab("Cursos") +
  ylab("Quantidade total de alunos")

# Histograma - Cores para cada classe (manual) #
ggplot(exemplo, aes(x = faculdade, fill = faculdade)) +
  geom_bar(stat = "count") +
  xlab("Cursos") +
  ylab("Quantidade total de alunos") +
  scale_fill_manual("Legenda", values = c("Direito" = "#76d7c4", "Enfermagem" = "#f0b27a", "Engenharia" = "#bb8fce")) +
  labs(title="Histograma") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))