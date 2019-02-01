#!/bin/bash
set_dot_env_value() {
  ENV=$1
  KEY=$2
  VALUE=$3
  PATH=$(dirname $ENV)

  if [[ ${#@} -ne 3 ]]; then
    echo -e "É necessário informar 3 argumentos:\n\t[1: endereço do .env],\n\t[2: variavel],\n\t[3: valor]"
    exit
  fi

  NEW_ENV=$(while read LINE; do
    if [[ "$LINE" == "$KEY="* ]]; then
      echo "$KEY=$VALUE\n"
    else
      echo "$LINE\n"
    fi
  done < $ENV)

  if /bin/cat $ENV | /bin/grep -q $KEY ; then
    echo -e $NEW_ENV > $PATH/${ENV}_2
  else
    echo "$KEY=$VALUE" >> $PATH/$ENV
  fi
}

set_dot_env_value $@
# set_dot_env_value .env APP_KEY MY_VALUE
# set_dot_env_value ./.env JWT_SECRET $(sudo docker-compose exec workspace php artisan jwt:generate)
