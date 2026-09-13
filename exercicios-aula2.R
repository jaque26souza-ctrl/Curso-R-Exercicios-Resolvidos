#1. Faça aparecer na tela a frase “R é uma ótima linguagem!” com o comando print().

print("R é uma ótima linguagem")

#2. Sabendo que as variáveis a, b e c valem, respectivamente, 3, 4 e 5,
# faça os cálculos abaixo:

a= 3
b= 4
c= 5
a
b
c
# a) d = a+b-c
d = a+b-c
print(d)
#  b) e = a*d – c
e = a*d - c
print(e)
#  c) f = √a^b + e^b
# Usa-se sqrt() para raiz e exp(b) para e^b
  f = sqrt(a^b) + e^b
  print(f)
#  d)(a + b)^2 − c
  (a + b)^2 - c

#e) log10(a + b)
  log10(a + b)

#3. Encontre a soma do vetor (array) v1 = (12, 16, 20, ... , 152).
  
  v1 = seq(12,152, by=4)
  print(sum(v1))

#4. Um paciente precisa receber 500 mg de um medicamento. O medicamento disponível
#no laboratório possui concentração de 250 mg/mL. Faça um programa em R que:
#a) Crie as variáveis dose e concentracao.
#b) Calcule o volume do medicamento que deve ser administrado.
#c) Mostre na tela o volume calculado.
  
  # Instalando pacote
  install.packages("svDialogs")
  library(svDialogs)
  
  # Pop-up para capturar a Dose
  dose <- as.numeric(dlg_input(message = "Digite a dose necessária (mg):")$res)
  
  # Pop-up para capturar a Concentração
  concentracao <- as.numeric(dlg_input(message = "Digite a concentração (mg/mL):")$res)
  
  # Validação e cálculo
  if (!is.na(dose) && !is.na(concentracao) && concentracao > 0) {
    volume <- dose / concentracao
  # Pop-up mostrando o resultado
    dlg_message(paste("O volume a ser administrado é:", volume, "mL"))
  } else {
    dlg_message("Por favor, insira valores numéricos válidos!")
  }
  
  # 5. Crie um problema exemplo (sem entrada do usuário) do problema:
   # Dado que o índice de massa corporal de uma pessoa é 
  #IMC = massa/altura2
  #faça a distinção das categorias:
    
    #IMC < 18.5 → abaixo do peso
  #18.5 ≤ IMC ≤ 24.9 → Peso normal
  #25 ≤ IMC ≤ 29.9 → Sobrepreso
  #IMC > 30 → obsedidade
  
  #Você deve criar as variáveis massa, altura e IMC, e então, através de condicionais, relatar qual a categoria
  #que a pessoa se encontra e seu IMC. Por exemplo, para uma massa de 70 kg e altura de 1.75m, a saída do
  #programa deverá ser: “Pessoa está com Peso Normal e seu IMC vale 22,85”.
  
  massa = 70
  altura = 1.80
  IMC = massa/altura^2
  if (IMC < 18.5) {
    print(paste("Pessoa abaixo do peso e seu IMC é", round(IMC, 2)))
  } else if (IMC <= 24.9) {
    print(paste("Pessoa está com Peso Normal e seu IMC vale", round(IMC, 2)))
  } else if (IMC <= 29.9) {
    print(paste("Pessoa está com Sobrepeso e seu IMC vale", round(IMC, 2)))
  } else {
    print(paste("Pessoa está com Obesidade e seu IMC vale", round(IMC, 2)))
  }
  
# 6. (Desafio) Escreva um programa em R que gere os 10 primeiros números de Fibonacci.
  # Definição da quantidade de termos
  n <- 10
  
  # Criação de um vetor numérico vazio com tamanho 10
  fib <- numeric(n)
  
  # Primeiros dois termos da sequência
  fib[1] <- 0
  fib[2] <- 1
  
  # Cálculo dos termos seguintes (do 3º ao 10º)
  for (i in 3:n) {
    fib[i] <- fib[i - 1] + fib[i - 2]
  }
  
  # Exibição dos 10 primeiros números
  print(fib)
#  7. (Desafio) Dada a sequência “ATGCGTACGTTAGC”, conte quantas vezes cada base aparece.
  #Se utilize de for e if-else.
  
  seq <- "ATGCGTACGTTAGC"
  print(seq)
  
  #Usando strsplit para quebrar a string dado o caracter de interesse
  
  bases <- strsplit(seq, "")[[1]]
  
  print(bases)
  
  ## Criando o contador de bases :
  
  # Inicializando um contador individual para cada base
  cont_A <- 0     ## Cria o contador começando do zero
  cont_T <- 0
  cont_C <- 0
  cont_G <- 0
  
  # Percorrendo cada caractere da sequência
  for (base in bases) {
    if (base == "A") {
      cont_A <- cont_A + 1
    } else if (base == "T") {
      cont_T <- cont_T + 1
    } else if (base == "C") {
      cont_C <- cont_C + 1
    } else if (base == "G") {
      cont_G <- cont_G + 1
    }
  }
  
  # Exibindo os resultados
  cat("A base A aparece", cont_A, "vezes.\n")
  cat("A base T aparece", cont_T, "vezes.\n")
  cat("A base C aparece", cont_C, "vezes.\n")
  cat("A base G aparece", cont_G, "vezes.\n")
  