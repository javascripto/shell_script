#!/bin/sh
# Shebang na primeira linha informando o interpretador do script
# shebang hashbang crunchbang pound-bang hash-pling
# meu comentário
echo "olá mundo!"


:<<'COMENTARIO'
este bloco de código
é um comentário tipo
heredoc do php. tudo
que é escrito aqui
não é executado.
Veja o exemplo
echo "asd"
COMENTARIO


# source é como um import ou require de script para a execução
# source funcoes.sh

# Dar permições de escrita para script
# chmod +x script.sh


# Mostrar qual é o shell padrão
# printenv SHELL

# Ver todos os shells disponiveis
# cat /etc/shells

# Mudar shell padrão
# chsh -s /bin/ash

# Ver o shell de todos usuarios do sistema
# cat /etc/passdw | cur -d: -f1.7


