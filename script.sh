#!/bin/sh

run() {
  app=$1

  if [ "$app" = 'app' ]; then
    echo "rodando app"
  elif [ "$app" = 'admin' ]; then
    echo "rodando admin"
  elif [ "$app" = 'api' ]; then
    echo "rodando api"
  fi
}

run() {
  case $1 in
    api)   echo "Rodando api" ;;
    app)   echo "Rodando app" ;;
    admin) echo "Rodando admin" ;;
    *)     echo "É necessário especificar uma aplicação para rodar" ;;
  esac
}

# run app

create_vscode_extensions_setup_backup() {
  echo '#!/bin/bash' > extensoes.sh
  chmod +x extensoes.sh
  echo "Procurando extensões do vscode..."
  list=$(code --list-extensions | while read linha; do echo "code --install-extension $linha"; done)
  echo 'Backup criado!'
  echo $list >> extensoes.sh;
  sleep 0.5 && echo '>>> extensoes.sh <<<'
}

calculadora() {
  clear
  printf "Digite p primeiro número: "; read n1
  printf "Digite o segundo numero: "; read n2

  echo "Escolha o número de uma operação:"

  operacoes=("soma" "subtração" "multiplicação" "divisão")

  select operacao in ${operacoes[*]}; do
    echo "Calculando..."; sleep 0.4
    break
  done

  case $operacao in
    soma)          echo "Resultado: $(($n1 + $n2))" ;;
    subtração)     echo "Resultado: $(($n1 - $n2))" ;;
    multiplicação) echo "Resultado: $(($n1 * $n2))" ;;
    divisão)       echo "Resultado: $(($n1 / $n2))" ;;
    *) echo "Opção inválida" ;;
  esac
}