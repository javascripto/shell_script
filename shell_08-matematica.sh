#!/bin/bash

# Matemática

echo "Soma 2 + 2 = $((2 + 2))"
echo "Subtração 3 - 2 = $((3 - 2))"
echo "Multiplicação 2 * 3 = $((2 * 3))"
echo "Divisão 2 / 2 = $((2 / 2))"
echo "Resto 7 % 4 = $((7 % 4))"
echo "Expoenciação 2 ** 8 = $((2 ** 8))"

echo "Forma de operação depreciada com colchetes: \$[7 * 9] = $[7 * 9]"

# atribuindo valores a variaveis com e sem declare
a=6+7; echo $a # 6+7
declare -i a; a=6+7; echo $a # 13

# Usando comando bc
echo 5/2 | bc           # 2
echo "scale=2;5/2" | bc # 2.5

# Usando Herestrings
bc <<< 5*6              # 30

# Decimal para binario e hexadecimal
echo "obase=2;7869" | bc  # 1111010111101
echo "obase=16;7892" | bc # 1ED4

# Usanado expr
expr 2+2   # 2+2
expr 2 + 2 # 4

# Contando caracteres com expr
expr length "shell script"

# Usando let
let a="2+2"; echo $a # 4

# Calculadora cientifica dc
echo '2 8 * p' | dc # 16
