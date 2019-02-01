#!/bin/bash

# Loops - for, while, until, for in do, break, continue, exit

# for
for ((i=0; i<=10; i++)); do
  echo $i
done

# for in
for i in {0..10}; do
  echo $i
done

# for in
for i in 1 2 3; do
  echo $i
done

# for in com seq
for i in $(seq 0 10); do
  echo $i
done

# seq
echo {0..10}       # 0 a 10
echo {0..10..2}    # 0 a 10 de 2 em 2
echo $(seq 0 10)   # 0 a 10
echo $(seq 0 2 10) # 0 a 10 de 2 em 2

# while
contador=0                      # iniciando contador com 0
while [ $contador -le 10 ]; do  # enquanto contador for menor ou igual a 10, faça
  echo $contador                # imprima o contado
  ((contador=$contador+1))      # incremente uma unidade ao contador
done

# until
contador=0                      # iniciando contador com 0
until [ $contador -gt 10 ]; do  # Até que o contador seja maior que 10, faça
  echo $contador                # imprima o contador
  let contador+=1               # incremente uma unidade ao contador
done

clear
_INPUT_STRING="Olá"
while [[ "$_INPUT_STRING" != "tchau" ]]; do
  echo "Você deseja ficar aqui? (\"tchau\" para sair)"
  read _INPUT_STRING            # Entrada de dados pelo teclado atribuindo a uma variavel
  if [[ "$_INPUT_STRING" = 'tchau' ]]; then
    echo "Ok, então. Bye!"
  fi
done

# tambem é possivel usar continue, break e exit em shell script
for i in {0..50}; do
  if [[ $(($i % 2)) -eq 0 ]]; then # se for numero par,
    continue                       # continue para proximo loop sem executar o restante do codigo
  fi
  if [[ $i -gt 10 ]]; then         # se for maior que 10
    break                          # pare o loop inteiro antes do combinado em {0..50}
  fi
  echo $i                          # So vai imprimir os números impares menores que 10
done
exit 0;                            # informa q a execução ocorreu sem erros e não executa mais nada depois dele


while; do clear; date; sleep 1; done
