# Instalando pacote car #
install.packages("car")

# Carregando pacote car e dplyir #
library(car)
library(dplyr)

attach(mtcars)

# Carregando o dataset contendo marcas de carros e salvando carros #
carros <- mtcars

# Gréfico de dispersão do dataset #
plot(carros$wt,
     carros$mpg,
     main = "Gráfico de dispersão",
     xlab = "Peso do carro",
     ylab = "Milhas por galão",
     pch = 19)

# Adicionando uma linha de regressão ao gráfico #
abline(lm(carros$mpg ~ carros$wt), col = "red")

# Salvando o gráfico em png #
png("../Imagens/Grafico_de_Dispersao.png")

# Gráfico de barras verticais #
numero_carros <- table(carros$gear)

barplot(main = "Gráfico de Barras Verticais",
        xlab = "Engrenagens",
        ylab = "Quantidade de carros",
        numero_carros,
        col = "blue")

# Gráfico de barras horizontais #
numero_carros <- table(carros$gear)

barplot(main = "Gráfico de Barras Horizontais",
        horiz = TRUE,
        numero_carros,
        names.arg = c("3 engrenagens", "4 engrenagens", "5 engrenagens"),
        xlab = "Quantidade de carros",
        ylab = "Engrenagens",
        col = "blue")

# Quantidade de alunos em cada curso de faculdade #
exemplo <- data.frame(
  "nome" = c("Joana", "Maria", "Joao", "Pedro", "Jose"),
  "idade" = c(21, 25, 28, 34, 18),
  "qtd_livros" = c(5, 1, 2, 1, 3),
  "faculdade" = c("Engenharia", "Engenharia", "Direito", "Enfermagem", "Engenharia"),
  stringsAsFactors = FALSE
)

# Quantidade de alunos em cada curso de faculdade #
engenharia <- exemplo %>%
  filter(faculdade == "Engenharia")
numero_alunos_eng <- length(engenharia$nome)

enfermagem <- exemplo %>%
  filter(faculdade == "Enfermagem")
numero_alunos_enf <- length(enfermagem$nome)

direito <- exemplo %>%
  filter(faculdade == "Direito")
numero_alunos_dir <- length(direito$nome)

# Gráfico de Pizza Simples #
slices <- c(numero_alunos_eng, numero_alunos_enf, numero_alunos_dir)
rotulos <- c("Engenharia", "Enfermagem", "Direito")
pie(slices,
    labels = rotulos,
    main = "Alunos por Curso"
)

# Gráfico de Pizza com Porcentagem #
porcentagem <- round(slices/sum(slices) * 100)
rotulos <- paste(rotulos, porcentagem)
rotulos <- paste(rotulos, "%", sep = "")
pie(slices,
    labels = rotulos,
    col = rainbow(length(rotulos)),
    main = "Quantidade de Alunos por Curso"
)

# Gráfico de Linha #
serie_temporal <- data.frame("ano" = c("2014", "2015", "2016", "2017", "2018"),
                             "media_temporal" = c(25, 19, 35, 40, 20),
                             stringsAsFactors = FALSE)

plot(y=serie_temporal$media_temporal,
     x=serie_temporal$ano,
     type="o",
     col="blue",
     main="Gráfico de Linha",
     xlab="Mês",
     ylab="Temperatura")

# Gráfico Boxplot #
boxplot(mpg ~ cyl,
        data = carros,
        main = "Gráfico Boxplot",
        xlab = "Número de cilindros",
        ylab = "Milhas por galão",
        col = "blue")
