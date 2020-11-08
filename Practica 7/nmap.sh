#!/usr/bin/env bash

#Se encarga de recortar la ip para poder ingresar el rango a escanear
function findIP (){

  ip=$1
  i=1
  j=0
  cont=0

  while [ $i -gt 0  ]
  do	 
    if [ "${ip:$j:1}" == "." ]
    then
       cont=$(( $cont + 1 ))
       j=$(( $j + 1 ))
       if [ $cont -eq 3 ]
       then	
          i=$(( $i - 1))	
       fi
    else
       j=$(( $j + 1 ))	     
    fi
  done
  echo ${ip:0:$j}
}

ipPri=$(hostname -I) 
ipPrivate=$(findIP $ipPri)
ipPublic=$(curl ifconfig.me)

echo "ingresa el rango que desea escanear de la ip privada"
read R1 R2

echo "Escaneando segmento de la ip privada..."
nmap1=$(nmap "$ipPrivate"$R1"-"$R2 | base64 | base64)
echo "Escaneando scanme.nmap.org" 
nmap2=$(nmap "scanme.nmap.org" | base64 | base64)
echo "Escaneando la ip publica"
nmap3=$(nmap "$ipPublic" | base64 | base64)

echo -e "\n$nmap1\n$nmap2\n$nmap3" > Evidencia.txt

echo "Listo!!"



