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

# Histograma Horizontal #
ggplot(data = exemplo, aes(x = faculdade, fill = faculdade)) +
  geom_bar(stat="count") +
  coord_flip() +
  xlab("Cursos") +
  ylab("Quantidade total de alunos") +
  ggtitle("Histograma") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Grafico de pontos #
mtcars$cyl <- as.factor(mtcars$cyl)

# Com regress�o $
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(shape=18, color="blue") +
  geom_smooth(method=lm, color="darkred") +
  labs(title="Gráfico de pontos")

# Por classe e com cores #
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl)) +
  geom_point() +
  labs(title="Gráfico de pontos") +
  scale_color_brewer(palette="Dark2")

# Grafico de pizza basico #
ggplot(exemplo, aes(x="", fill=faculdade)) +
  geom_bar(stat="count", width=1) +
  coord_polar("y", start=0)

ggplot(exemplo, aes(x="", fill=faculdade)) +
  geom_bar(stat="count", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() + labs(title = "Gráfico de pizza") # remove background, grid, numeric labels

# Calculando quantos estudantes ha em cada curso #
count.data <- exemplo %>%
              count(faculdade)

# Realizando a soma acumulativa dos dados e criando rotulos #
exemplo_2 <- count.data %>%
          mutate(faculdade = factor(faculdade, levels = c("Engenharia", "Direito", "Enfermagem")),
                 soma_acumulativa = cumsum(n),
                 midpoint = soma_acumulativa - n / 2,
                 label = paste0(round(n / sum(n) * 100, 1), "%"))

# Grafico de pizza com rótulos #
ggplot(exemplo_2, aes(x = 1, weight = n, fill = faculdade)) +
  geom_bar(width = 1, position = "stack") +
  coord_polar(theta = "y") +
  geom_text(aes(x = 1.3, y = midpoint, label = label)) +
  scale_fill_brewer(palette="Set1") +  theme_void() +
  labs(title = "Gráfico de pizza com rótulos") +
  theme(plot.title = element_text(hjust = 0.5)) + # centralizando título
  labs(fill='Cursos')
