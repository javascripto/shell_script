#!/bin/bash

# Shell Script para web

# sudo apt install apache2
# É necessário habilitar o modo CGI e extensão .sh ativada no apache
# http://terminalroot.com.br/2015/09/habilitando-cgi-e-sh-no-apache-do.html

# sudo nano /etc/apache2/mods-available/cgi.load
# Procurar essa linha e descomente:
# LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so

# sudo nano /etc/apache2/mods-enabled/mime.conf
# Descomente a linha e acrescente a extensão .sh:
# AddHandler cgi-script .cgi .sh

# Diretorio /usr/lib/cgi-bin executa arquivos no navegador no endereço http://localhost/cgi-bin/
# Para mudar isso voce pode editar o arquivo:
# sudo nano /etc/apache2/sites-available/000-default.conf
# E adicionar antes da tag o seguinte:
# ScriptAlias /sh/ /usr/lib/cgi-bin/
# reinicie o apache novamente:
# sudo systemctl apache2 restart
# crie um arquivo: /usr/lib/cgi-bin/index.cgi
# De permissões para o arquivo: sudo chmod a+x /usr/lib/cgi-bin/index.cgi
# Já pode acessar http://localhost/sh/index.cgi

# Conteudo do arquivo:

#!/bin/bash
n1=9 n2=4
echo 'content-type: text/html'
echo
echo '<h1>Olá, Mundo</h1>'
echo "<h3>A soma entre $n1 e $n2 é $((n1 + n2))</h3>"


# Se der problema de permissão execute:
# sudo chown -R debian:debian /usr/lib/cgi-bin

# Para receber o body de uma requisição POST, basta ler o conteudo em uma variavel:
# read body; echo $body

# Separando campos do body:
#!/bin/bash
echo 'content-type: text/html'
echo
read body

IFS="&"
echo $body
for each in $body; do
  field=$(echo -e "$each" | cut -d= -f1)
  value=$(echo -e "$each" | cut -d= -f2)
  echo "$field: $value <br>"
done


# Testando:
# curl -X POST -d "nome=yuri&idade=25&cidade=Sao%20Paulo" http://localhost/cgi-bin/post.sh
