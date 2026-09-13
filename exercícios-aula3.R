# Resolucao dos exercicios - Aula 3 ############################################

#1. Crie um vetor aleatório de 1000 posições com média igual a 20 e desvio padrão igual a 4, e execute as seguintes operações:
#a) Encontre a média, mediana e moda.
#b) Possui distribuição normal (há normalidade)? O qqplot mostra isso?
#c) Encontre o primeiro, segundo e terceiro quartil. Logo após, verifique o inter-quartil.
#d) Encontre o coeficiente de variação.
#e) Encontre o desvio padrão e a variância.
#e) Retire uma amostra de 100 valores, sem reposição. Compare a média e o desvio da sua amostra em relação aos dados originais. Ficaram próximos? Relate.
#f) Faça um boxplot da sua amostra e do seu dado original. Ficou parecido?

# Criando um vetor de 1000 posições, média igual a 20 e dp=4 
vetor <- round(rnorm(n = 1000, mean = 20, sd = 4)) # round na frente gera vetor de numeros inteiros
print(vetor) # Se o round não estivesse ali, geraria 1000 numeros continuos e não inteiros

summary(vetor) # verificando media, mediana de forma resumida

# Calculando:

mean(vetor) #media
min(vetor) #min
max(vetor) #max
sd(vetor)#desvio padrao
var(vetor) #variancia
median(vetor) #mediana

## Calculando a moda 
install.packages("modeest")  # instalando pacote para calcular moda
library(modeest) # abrindo o pacote
mfv(vetor) # função que calcula a moda

# Verificando a normalidade 
shapiro.test(vetor) ## rodando o teste
qqnorm(vetor) # verificando o qqplot
qqline(vetor, col = "red")

#quartis e decis
quantile(vetor)
quantile(vetor, 0.25) # first quartile
quantile(vetor, 0.75) # third quartile
quantile(vetor, 0.4) # 4th decile
quantile(vetor, 0.98) # 98th percentile
IQR(vetor) #interquartil: difference between the first and third quartile

#coeficiente de variacao
CV <- (sd(vetor) / mean(vetor))*100
CV

# Amostragem

amostra <- sample(vetor, size=100, replace = FALSE)
summary(amostra)
summary(vetor)
sd(vetor)
sd(amostra)
# A media, mediana e DP ficaram similares da amostragem e dos dados originais. 

## Gerado gráficos ###### 

#boxplot dados originais 
boxplot(vetor,col = "#FAB072") #salmao

#boxplot dados de amostragem
boxplot(amostra) # se nao colocar a cor ele fica cinza padrao
boxplot(amostra,col = "pink") 

#2. Abaixo temos os valores dos níveis de linfócitos e neutrófilos para 10 pacientes observados durante uma pandemia GLOBAL.
Neutrófilo <- c(65,56,45,44,35,30,21,19,12,10)
Linfócito <- c(12,17,21,23,32,36,43,47,55,63)

#a) Através de um scatter plot, tire conclusões.
#b) Faça um plot com as informações adequadas, como título nos eixos e no gráfico.
# Gerando gráficos
## Scatter plot
plot(Neutrófilo, Linfócito,col="red",
     xlab = "Níveis de neutrófilos",ylab="Níveis de linfócitos",
     main="Scatter plot dos níveis de linfócitos e neutrófilos")

# Criando o boxplot comparativo
boxplot(Neutrófilo, Linfócito,
        names = c("Neutrófilos", "Linfócitos"),
        col = c("lightblue", "lightgreen"),
        ylab = "Níveis (%)",
        main = "Comparação da Distribuição de Neutrófilos e Linfócitos")

