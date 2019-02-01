#!/bin/bash

# Comandos do shell - builtins, coreutils, ...

# Comandos comuns: echo, ls, cd, rm, mkdir, pwd, clear, touch, ...

# eval     - Executa o comando contido em uma string armazenado em uma variavel
# exec     - Substitui o processo atual pelo comando especificado. o exec cria a segunda parte da junção, o que não seria possível usando o pipe |.
# readonly - Define uma variavel como somente leitura. parecido com declare -r
# shift    - Altera posição de parametros em um script. Como um array shift removendo o primeiro item da lista de parametros
# trap     - Comando builtin para tratamento de sinais. É como se fosse um listener de eventos do terminal/systema
#            Ex: o pc vai desligar e manda um sinal, entao voce pode tomar decisoes come sse comando. kill -l mostra todos os sinais
#            Exemplos aqui: https://www.shellscript.sh/trap.html
# man      - Interface para os manuais Manual de referencia online 

# Mais:
# https://pt.wikipedia.org/wiki/GNU_Core_Utilities
# http://comandoslinux.com/
# http://www.uniriotec.br/~morganna/guia/index_guia.html
# http://ss64.com/bash
# https://explainshell.com/


# eval
eval "ls"
A='ls' && eval $A
B='A' && eval '$'$B

# exec
md filepath && touch teste/file.{exe,jpg,png}
find filepath/ -name file.e*                 # file.exe
find filepath/ -name file.e* | rm            # erro
find filepath/ -name file.e* -exec rm {} \;  # success

# readonly
Z=123 && echo $Z           # 123
Z=456 && echo $Z           # 456
readonly Z=123 && echo $Z  # 123
Z=456                      # erro

# shift
funcTeste() {
  shift
  echo "Parametros passados exceto primeiro: $@"
}
funcTeste primeiro segundo terceiro # Omite o primeiro parametro
# O shift pode ser usado varias vezes para ir removendo os sempre os primeiros itens da lista de argumentos


# man
man man
man echo
man ls
man cd
xman

