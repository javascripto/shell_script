#!/bin/bash

# http://aurelio.net/shell/canivete/
# http://terminalroot.com.br/2015/08/45-exemplos-de-variaveis-e-arrays-em_19.html


# !486 # executar comando pelo numero no history
# !! # executar ultimo comando digitado


# Variaveis

NOME="yuri"
IDADE=25

echo "Olá, sou $NOME e tenho $IDADE anos"

# Os comandos printenv ou env imprimem a lista de variaveis globais

unset IDADE # destroi a variavel
echo $IDADE # Não exibe mais

# Constantes
declare -r CONSTANTE="sempre igual"
CONSTANTE="Outra coisa"
echo $CONSTANTE # sempre igual

# Executando uma string:
comando="echo Olá, Mundo!"
$comando
${!comando}

# Pacotes de funcionalidades shell
# sh-utils, Shellutils, Fileutils, coreutils, ...

# o comando 'set' é usado para mostrar/modificar variaveis locais.
# o comando 'export' exporta uma variavel para as variaveis globais
# Dica: set -o (mostra off e on) e noclubber (> para não sobrepor).


:<<'VARIAVEIS'

OLA="Olá, Mundo\!"
export OLA
set | grep OLA  
env | grep OLA
printenv | grep OLA

VARIAVEIS


# Variaveis especiais são variaveis compostas de números
# e caracteres que passam parâmetros para funções/scripts
# e exibem status do script.

# pareia a aula 4 no minuto 9:46

:<<'VARIAVEIS_ESPECIAIS'


Variável	| Parâmetros Posicionais
$0          # Parametro número 0  (Nome do comando ou função)
$1          # Parametro numero 1  (da linha de comando ou função)
...         # Parametro numero N
$9          # Parametro numero 9  (da linha de comando ou função)
${10}       # Parametro numero 10 (da linha de comando ou função)
...         # Parametro numero NN
$#          # Número total de parametros da linha de comando ou função
$*          # Todos os parametros, como uma string única
$@          # Todos os parametros, como várias strings protegidas
----------------------------------------------------------------------
Variável | Miscelânia
$$         # Número PID do processo atual (do proprio script)
$!         # Número PID do último job em segundo plano
$_         # Último argumento do último comando executado
$?         # Código de retorno do último comando executado

VARIAVEIS_ESPECIAIS


# Expansão de variaveis em shell
# Usa-se um cifrão e parenteses/colchetes: $(comando) ${comando}
# Ou até mesmo crases: `comando`
# O comando é executado em um subshell em segundo plano de forma oculta 
# Exemplos:
# scripts=$(ls *.js)
# files=`ls`

listar_arquivos() {
  for file in $(ls); do
    echo "Arquivo: $file"
  done
}

backup_extensoes() {
  file="extensions.sh"
  cmdList="code --list-extensions"

  echo "#!/bin/sh" > $file
  chmod +x $file

  for extensao in `$cmdList`; do
    echo "code --install-extension $extensao" >> $file
  done
}

:<<'EXPANSAO'

Sintaxe	           Expansão Condicional
${var:-texto}	     Se var não está definida, retorna 'texto'
${var:=texto}	     Se var não está definida, defina-a com 'texto'
${var:?texto}	     Se var não está definida, retorna o erro 'texto'
${var:+texto}	     Se var está definida, retorna 'texto', senão retorna o vazio
---------------------------------------------------------------------------------
Sintaxe	            Expansão de Strings
${var}	            É o mesmo que $var, porém não ambíguo
${#var}	            Retorna o tamanho da string
${!var}	            Executa o conteúdo de $var (igual 'eval \$$var')
${!texto*}	        Retorna os nomes de variáveis começadas por 'texto'
${var:N}	          Retorna o texto a partir da posição 'N'
${var:N:tam}	      Retorna 'tam' caracteres a partir da posição 'N'
${var#texto}	      Corta 'texto' do início da string
${var##texto}	      Corta 'texto' do início da string (* guloso)
${var%texto}	      Corta 'texto' do final da string
${var%%texto}	      Corta 'texto' do final da string (* guloso)
${var/texto/novo}	  Substitui 'texto' por 'novo', uma vez
${var//texto/novo}	Substitui 'texto' por 'novo', sempre
${var/#texto/novo}	Se a string começar com 'texto', substitui 'texto' por 'novo'
${var/%texto/novo}	Se a string terminar com 'texto', substitui 'texto' por 'novo'
${var^}	            Converte para maiúscula o primeiro caractere
${var^^}          	Converte para maiúscula todos os caracteres
${var,}	            Converte para minúscula o primeiro caractere
${var,,}          	Converte para minúscula todos os caracteres
${var~}	            Inverte maiúscula/minúscula do primeiro caractere
${var~~}          	Inverte maiúscula/minúscula de todos os caracteres

EXPANSAO

# Curiosidade # não funciona no /bin/sh mas funciona no zsh ou bash
# echo t{r,igr,rist}es

# Tamanho da string ou array:
# echo ${#string}
# echo ${#array[*]}

# Retorna x caracteres a partir da posição y
# x=6 y=5 nome="Yuri Alves de Almeida"
# echo ${nome:$y:$x} # Alves

# Retorna os nomes de variaveis começadas com 'U'
# echo ${!U*} # UID USER USERNAME

# var="https://google.com.br"
# echo ${var#https://}      # Corta 'https://' do inicio da string
# echo ${var%.br}           # Corta '.br' do final da string
# echo ${var/google/bing}   # Substitui 'google' por 'bing'

# Retorna resultado de uma operação logica ou aritimetica
# echo $((5 > 2 )) # 1
# echo $((2 > 9 )) # 0
# echo $((2 + 2)) # 4

# Testa uma expressão, retornando 0 ou 1
# [ 5 -gt 3 ] && echo 'É maior!'
# test 5 -gt 3 && echo 'É maior'
# [[ $var ]] && echo 'Existe essa variável'


# Arrays - no shell script não usamos virgula para separar os itens do array

palavras=("Shell Script" "Bash" "GNU" "Linux" "Debian")

# echo $palavras # Shell Script - Só imprime o primeiro item
# echo ${palavras[0]}  # Shell Script
# echo ${palavras[1]}  # Bash
# echo ${palavras[2]}  # GNU
# echo ${palavras[-1]} # Debian - Imprime o ultimo

palavras[0]="Definidno novo valor do item 0" # Não usa cifrão na atribuição

# Todos items do array:
# echo ${palavras[@]}
# echo ${palavras[*]}

# Quantidade de itens
len=${#palavras[@]} # Array lenght

# Remover item ouarray inteiro
# unset paralvras[2]
# unset palavras

# Exibir  itens da posição x atẽ y
# a=1 b=2
# echo ${palavras[*]:$x:$y}

# Mais em:
# terminalroot.com.br/2015/08/45-exemplos-de-variaveis-e-arrays-em_19.html

# for i in $(seq 0 $len); do
#   echo ${palavras[$i]}
# done

# for ((i=0; i<= 10; i++)); do echo $i; done;
# for i in $(seq 0 10); do echo $i; done