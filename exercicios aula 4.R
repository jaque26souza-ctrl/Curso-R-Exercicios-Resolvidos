## Exercicios resolvidos - Aula 4 ###############
# Carregando o dataset 
data <- mtcars

# a) Verifique se as colunas que deveriam ser categ?ricas (vs e am) realmente s?o atrav?s do comando str(data).
#Caso n?o estejam como fatores, utilize o comando as.factor() sobre a pr?pria coluna para alter?-la.
#Caso elas n?o estejam,os boxplots n?o lidar?o com vari?veis num?ricas no eixo x, por isso desta necessidade.

str(data)
# vs e am estao como numerico
# Converte a coluna para fator
data$vs <- as.factor(data$vs)
data$am <- as.factor(data$am)

str(data) # confirmando que foi alterado para dado fatorial

#b) Encontre a media, mediana e o desvio padrao da coluna milhas por galao (coluna mpg).
mean(data$mpg)
median(data$mpg)
sd(data$mpg)

# Os resultados de milhas por gal?o: 
#media: 20.09062
# mediana: 19.2
# desvio padrao: 6.026948

# c) Faça um scatter plot entre as colunas mpg e wt. Qual a conclusao? Verifique a correlacao.
plot(data$mpg, data$wt) #plotando scatter plot
shapiro.test(data$wt)
shapiro.test(data$mpg)
cor(data$mpg, data$wt,method = "pearson")

#Existe uma forte correção negativa entre Miles/(US) gallon e Weight (lb/1000). pearson = -0.8676594

# d) Existem mais carros com transmissão automática ou manual (coluna ‘am’)? Aplique o comando table().

 table(data$am)
 #Transmission (0 = automatic, 1 = manual); existem mais carros automaticos (19) do que manuais(12)
 
# e) Faça um boxplot do horsepower em funcao do numero de cilindros. O que observou de tendência? E se fizéssemos o mesmo boxplot pela transmissão (autom/manual). O que observou de tendência?

# Boxplot simples 
 
 boxplot(hp ~ cyl,
         data = data, 
         xlab = "Número de Cilindros",
         ylab = "Potência (hp)",
         main = "Potência por Número de Cilindros",
         col = c("pink", "lightblue", "purple"),
         las = 1,           # Mantem os valores do eixo Y na horizontal
         frame.plot = FALSE # Remove o contorno das bordas superior e direita
 )
 
 # Boxplot com ggplot2
 library(ggplot2)
 
 ggplot(data, aes(x = factor(cyl), y = hp, fill = factor(cyl))) +
   geom_boxplot(show.legend = FALSE) +
   scale_fill_manual(values = c("purple", "lightblue", "pink")) +
   labs(title = "Potência por Número de Cilindros",
        x = "Número de Cilindros",
        y = "Potência (hp)") +
   theme_minimal()
 
# f) Faca um scatter plot da coluna hp e wt. Qual a conclusao? Verifique a correlacao

 plot(data$hp, data$wt) #plotando scatter plot
 
 #Verificando correlacao
 shapiro.test(data$wt)
 shapiro.test(data$hp)
 cor(data$hp, data$wt,method = "spearman")
 
 #Apresenta forte correlação positiva entre hp e wt (0.7746767)
 
# g) Crie uma nova coluna chamada NC, onde 𝑁𝐶=𝑐𝑦𝑙∗𝑚𝑝𝑔.
 #Faça um boxplot do valor de NC em função da transmissao. O que observou?

 #Criando uma nova coluna: NC=cyl*mpg
data$NC <- data$cyl*data$mpg
data$NC 

#Criando boxplot: NC em função da transmissao
boxplot(NC ~ am,
        data = data, 
        xlab = "Transmissão",
        ylab = "NC",
        main = "NC em função da trasmissão (am)",
        col = c("pink", "lightblue", "purple"),
        las = 1,           
        frame.plot = FALSE #
)

# h) Filtre e calcule a media da eficiencia em milhas por galão de carros que possuem 𝑚𝑝𝑔<20.
#Filtrando e calculando a media da eficiencia em milhas por galao
media_mpg_menor20 <- mean(data$mpg[data$mpg < 20], na.rm = TRUE) 
#Exibindo a media
media_mpg_menor20
# A media: 15.9

# i) Filtre e calcule a mediana do peso (coluna wt) de carros que possuem 𝑚𝑝𝑔<20 e ℎ𝑝>180.

############# Usando pacote nativo do R ##################################

# Filtra o vetor de pesos 'wt' com as duas condições e calcula a mediana
mediana_wt <- median(data$wt[data$mpg < 20 & data$hp > 180], na.rm = TRUE)

# Exibe o resultado
mediana_wt
# A mediana foi 3.84


####################### Usando o pacote dplyr #################################################################

library(dplyr) #Carrega o pacote 
# Filtra e calcula a mediana
data %>%
  filter(mpg < 20, hp > 180) %>%
  summarise(mediana_peso = median(wt, na.rm = TRUE))

# A mediana permanece a mesma, unica coisa que muda que consegue fazer tudo em um comando

# j) Verifique o nome das linhas e nome das colunas do dataset mtcars.

rownames(mtcars) # nomes de cada linha

colnames(mtcars) # nomes das colunas
