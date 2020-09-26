#!/usr/bin/env bash
set -euo pipefail

#username
GIT_USR=$1
#repositorio
GIT_REPO=$2
#archivo a inspeccionar
GIT_FILE=$3

#obtener informacion
echo -e "\n\n empieza el primer curl\n\n"

curl "https://github.com/$GIT_USR/$GIT_REPO"

echo -e "\n\n acaba el primer curl\n\n"

#buscar un archivo 
echo -e "\n\n empieza el segundo curl\n\n"

curl --user $GIT_USR --data @$GIT_FILE https://github.com/$GIT_USR/$GIT_REPO

echo -e "\n\n acaba el segundo curl\n\n"

#obtiene la cantidad maxima de solicitudes que puedes hacer,
#las que te quedan y cuando se restableceran

echo -e "\n\n empieza el tercer curl\n\n"

curl -i "https://github.com/$GIT_USR"

echo -e "\n\n acaba el tercer curl\n\n"

