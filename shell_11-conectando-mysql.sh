#!/bin/bash

# sudo apt install mysql-server mysql-client
# http://terminalroot.com.br/2011/10/curso-certificacao-linux-lpi-102.html

distros=("Debian" "Ubuntu" "RedHat" "Deepin" "Slackware" "Arch" "Manjaro")

echo 'content-type: text/html; charset=utf-8'
echo \
"
<h1>Olá, Mundo</h1>
<form action=\"post.sh\" method=\"post\">
    <input type=\"text\" name=\"nome\" placeholder=\"nome\">
    <input type=\"email\" name=\"email\" placeholder=\"email\">
    <select name=\"distro\">
        $(for distro in ${distros[@]}; do
            echo "<option>$distro</option>"
        done)
    </select>
    <input type=\"submit\" value=\"OK\">
</form>
"

exit

# crud.sh

USUARIO="root"
SENHA="root"
TABELA='distros'
BANCO="shell_script"

# Usar senha no comando inline não é indicado
# A senha deve ser colocada neste arquivo:
# sudo nano /etc/mysql/my.cnf
# [client]
# password = root

read_db() {
  QUERY="SELECT * from $TABELA"
  conn="mysql -u $USUARIO -e \"$QUERY\" $BANCO"
  IFS="$(echo -e '\t')"
  conn=$(echo "$conn" | sed '1d')
  echo $conn
}

insert_db() {
  query="INSERT INTO $TABELA VALUES (NULL, $1)"
  conn=$(mysql -u $USUARIO -e "$query" $BANCO)
}

schema="CREATE SCHEMA shell_script; use shell_script;"

tabela_infos="
CREATE TABLE infos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(16) NOT NULL,
    email VARCHAR(100) NOT NULL
);"

tabela_distros="
CREATE TABLE distros (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    distro VARCHAR(20) NOT NULL
);
INSERT INTO distros VALUES (NULL, 'Debian');
INSERT INTO distros VALUES (NULL, 'Ubuntu');
INSERT INTO distros VALUES (NULL, 'Deepin');
INSERT INTO distros VALUES (NULL, 'RedHat');
INSERT INTO distros VALUES (NULL, 'Gentoo');
INSERT INTO distros VALUES (NULL, 'Manjaro');
INSERT INTO distros VALUES (NULL, 'Slackware');
"