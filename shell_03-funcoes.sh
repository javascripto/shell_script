#!/bin/bash

# Funções


# function statement
revisao_arrays() {
  # array
  pessoas=("Yuri" "Jota" "Keu" "Yvinis")

  # print all items
  echo ${pessoas[*]}

  # print item on index
  echo ${pessoas[1]}

  # array length
  echo ${#pessoas[@]}
}


# function calling
revisao_arrays

# function params
hello() {
  echo "Hello $1"
}
hello world

###

sum() {
  echo "$1 + $2 = $(($1 + $2))"
}
sum 8 9

###

count_args() {
  echo "Você passou $# parametros"
  echo "Argumentos passados: $@" # $* tambem funciona
}
count_args primeiro segundo terceiro quarto

###

corta_argumentos() {
  echo ${@:2}   # todos argumentos exceto o primeiro e o nome do comando
  echo ${@:0:1} # nome da funcao
  # tambem é possivel usar o comando shift para remover o primeiro item da lista de parametros
}

###

errors() {
  #  asdzxlkasd descomente para provocar um erro
  if [ $? -eq 0 ]; then
    echo "Sem erros"
  else
    echo "Ocorreram errors"
  fi
}
errors

###

# splice_args() {
#   echo $@
# }
# splice_args primeiro segundo terceiro

###

# return
# serve para retornar codigos de erro ou sucesso
# 0 representa sucesso, qualquer outro numero representa erros
func() {
  return 0
}
func

# retorno com echo 
retorno_com_echo() {
  echo $(($1 + $2))
}
result=$(retorno_com_echo 5 12)

echo "O resultado é: $result"


# Escopo de variaveis
# Funções tem acesso a variaveis declaradas fora do seu escopo
# Variaveis declaradas dentro do escopo da função tambem estão disponiveis de forma global após invocar a função
# Para restringir uma variavel ao escopo de função é necessário usar a palavra local antes da declaracao da variavel

nome="Fulano"

escopo_var() {
  local nome="Yuri"
  echo $nome
}

echo $nome # Fulano
escopo_var # Yuri
echo $nome # Fulano

# apagando uma funcao
unset func


# importando funcoes de um arquivo exteno
# use o comando source para importar funcoes de outro arquivo para o atual
# source functions.sh
# function1 arg1 arg2

clear
# Builtin
cd() {
  echo "Comando cd que substitui o original"
}
cd /home && ls          # usando funcao craida
builtin cd /home && ls  # usando comando builtin do shell

