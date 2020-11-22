#!/usr/bin/env bash

echo "Ingresa un proceso"
read proceso
echo "Ingresa tu direccion de correo y tu contraseña"
read user pass
echo "Ingresa la direccion del destinatario"
read to

$proceso && echo "Proceso terminado con exito" || touch error.txt

if [ -f "error.txt" ]
then
    echo "Error en el proceso"
    rm "error.txt"    
    cont=1
else
    cont=0

fi

echo $cont

python3 correo.py -error $cont -user $user -pasw $pass -to $to

