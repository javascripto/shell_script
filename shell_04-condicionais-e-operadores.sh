#!/bin/bash

# Condições

# Comando test

# Saída 0 ou 1 para sucesso ou erro
# testando se 1 é igual a 1
test 1 = 1 ; echo $? # 0
test 1 = 2 ; echo $? # 1

# testando se arquivo ou diretorio existe
test -e arquivo.txt ; echo $?

# testando se é um arquivo normal?
test -f arquivo.txt ; echo $?

# testando se é um diretorio
test -d .. ; echo $?

# Usando if then else elif fi

var=2
if test $var -eq 1; then
  echo "Variavel igual a um"
elif test $var -eq 2; then
  echo "Variavel igual a dois"
else
  echo "Variavel diferente de 1 e de 2: \$var = $var"
fi

# if sem comando test. É necessário espaço entre os colchetes

var=1
if [ "$var" -eq 1 ]; then
  echo "Variavel igual a um"
elif [ "$var" -eq 2 ]; then
  echo "Variavel igual a dois"
else
  echo "Variavel diferente de 1 e de 2: \$var = $var"
fi


# Usando double brackets [[]] nas condições, alguns erros podem ser evitados no uso de operadores logicos
# Por exemplo: comparar strings com o operador '-eq' ao invés do operador '=', provoca um erro no script,
# esse erro pode ser evitado ao fazer a comparação com colchetes duplos: [[ "$variavel" -eq "testando" ]]

# A preferencia é usar sempre o comando test no lugar de [] e usar [[]] no lugar de [] para q o script rode em qualquer terminal e seja portável


nome="Yuri"
if [[ "$nome" -eq "Yuri" ]]; then # Essa comparação provocaria um erro se não tivesse double bracktes
  echo "Olá Yuri!"
elif [ "$nome" = "Jota" ]; then
  echo "OLá, Jota"
fi

run() {
  app=$1
  if [ "$app" = 'app' ]; then
    echo "Rodando app"
  elif [ "$app" = 'admin' ]; then
    echo "Rodando admin"
  fi
}

run admin


# case e esac

run() {
  app=$1
  case $app in
    app) echo "Rodando app" ;;
    admin) echo "Rodando admin" ;;
    api|API) echo "Rodando api ou API" ;;
    *) echo "É necessário informar um programa para executar" ;;
  esac
}

run API



# https://aurelio.net/shell/canivete/#test
# Opções do comando test ou [
# 
# Comparação Numérica
# 
# -lt	É menor que (LessThan)
# -gt	É maior que (GreaterThan)
# -le	É menor igual (LessEqual)
# -ge	É maior igual (GreaterEqual)
# -eq	É igual (EQual)
# -ne	É diferente (NotEqual)
# 
# Comparação de Strings
# 
# =	É igual
# !=	É diferente
# -n	É não nula
# -z	É nula
# 
# Operadores Lógicos
# !	NÃO lógico (NOT)
# -a	E lógico (AND)
# -o	OU lógico (OR)
# 
# Testes em arquivos
# 
# -b	É um dispositivo de bloco
# -c	É um dispositivo de caractere
# -d	É um diretório
# -e	O arquivo existe
# -f	É um arquivo normal
# -g	O bit SGID está ativado
# -G	O grupo do arquivo é o do usuário atual
# -k	O sticky-bit está ativado
# -L	O arquivo é um link simbólico
# -O	O dono do arquivo é o usuário atual
# -p	O arquivo é um named pipe
# -r	O arquivo tem permissão de leitura
# -s	O tamanho do arquivo é maior que zero
# -S	O arquivo é um socket
# -t	O descritor de arquivos N é um terminal
# -u	O bit SUID está ativado
# -w	O arquivo tem permissão de escrita
# -x	O arquivo tem permissão de execução
# -nt	O arquivo é mais recente (NewerThan)
# -ot	O arquivo é mais antigo (OlderThan)
# -ef	O arquivo é o mesmo (EqualFile)
