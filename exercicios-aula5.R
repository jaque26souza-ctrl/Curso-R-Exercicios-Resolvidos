###### Exerc?cios Aula 5 ########################################################

#Carregue o arquivo ?dataset_pacientes.xlsx? e fa?a o que se pede.

############ Carregar o pacote###################################################
library(readxl)

############### Ler a planilha .xlsx ############################################
dados_pacientes <- read_excel("dataset_pacientes.xlsx")

##### Checando a planilha #####################################################
head(dados_pacientes)

#1. Mostre o n?mero de linhas e colunas do dataset.

#numero de linhas
nrow(dados_pacientes)

#numero de colunas
ncol(dados_pacientes)

#2. Selecione, aleatoriamente, 30 linhas do dataset e aplique o comando summary() sobre a amostra.

#selecao de 30 linhas do dataset
#install.packages("dplyr")
library(dplyr)
sample_data <- sample_n(dados_pacientes, 30, replace = FALSE)
summary(sample_data)

#3. Selecione pacientes com niveis de hematocrito maior que 35.

hemat <- subset(dados_pacientes, hematocrito > 35) # selecionando pacientes com hematocrito > 35
print(hemat, n=47) #mostrando todas as 47 linhas com hematocrito > 35

#4. Selecione pacientes do sexo masculino com IMC maior que 24 e neutrofilos maior que 40.
pacientes_masc_IMC <- subset(dados_pacientes, IMC > 24 & neutrofilos > 40 & sexo == "M")
pacientes_masc_IMC

#5. Crie uma nova coluna chamada Nivel_IMC, segunda a classe abaixo a respeito do seu valor de IMC:
 # - Baixo peso: IMC < 18
#  - Normal: IMC > = 18 e IMC < 25
#  - Acima do peso: IMC >= 25 e IMC < 30
#  - Obesidade: IMC >= 30

pacientes_atualizada <- mutate(dados_pacientes,nivel_IMC = case_when(
    IMC < 18 ~ "Baixo peso",
    IMC >= 18 & IMC < 25 ~ "Peso Normal",
    IMC >= 25 & IMC < 30 ~ "Acima do peso",
    IMC >= 30 ~ "Obesidade")
  ) %>% mutate(nivel_IMC = as.factor(nivel_IMC))

glimpse(pacientes_atualizada)

# 6. Estratifique por quartis a coluna hematocrito criando uma coluna nova chamada Classe Hematocrito.

dados_pacientes$Classe_Hematocrito <- cut(
  dados_pacientes$hematocrito,
  breaks = quantile(dados_pacientes$hematocrito, probs = seq(0, 1, 0.25), na.rm = TRUE),
  labels = c("Q1 (Baixo)", "Q2 (Médio-Baixo)", "Q3 (Médio-Alto)", "Q4 (Alto)"),
  include.lowest = TRUE 
)

######### Conferindo o resultado e a contagem por quartil ############################
table(dados_pacientes$Classe_Hematocrito)
head(dados_pacientes)
