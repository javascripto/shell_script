#!/bin/bash

# Fluxo de E/S padrão e operadores de Fluxo
# Entrada e Saída = IO

# Arquivos de loop infinito que representam I/O E/S
# /dev/stdin  - 0 
# /dev/stdout - 1
# /dev/stderr - 2
# /dev/null         # Buraco negro do unix

# Operadores redirecionadores
# |  Pipe ou Pipeline - Liga stdout de um comando ao stdin de outro comando
# >  Write - Redireciona o stdout para outro local como um arquivo por exemplo
# >> Append - Anexa o stdout par aoutro local

# Exemplos:
ls > arquivos.txt  # esse redirecionador sobrescreve o arquivo

echo -n "Olá"   >> arquivo.txt
echo -n "Mundo" >> arquivo.txt
cat arquivo.txt # OláMundo

echo "Esse conteúdo" > lista.txt 2> /dev/stdout

# Usando pipe
echo -e "pera\nuva\nmaçâ\nbanana\nmaçâ\nuva" | sort           # ordena lista
echo -e "pera\nuva\nmaçâ\nbanana\nmaçâ\nuva" | sort | uniq    # ordena lista e remove linhas repetidas


rm {arquivo{,s},lista}.txt # apagando arquivos gerados nos exemplos