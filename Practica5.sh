#!/usr/bin/env bash

i=1

while [ $i -gt 0 ]
do

   echo "ingresa el archivo o presiona 2 para salir"
   read Archivo 

   if [ $Archivo = 2 ]
   then
     exit 0 
   fi  

   md5=$(md5sum $Archivo | cut -f 1 -d " ") 

   if [ $md5 == "4260808329804b5f553cf3e3d5a446c6" ] #fcfm.png
   then

      cat $Archivo | base64 | base64 > fcfm.txt
      echo "Codificacion completada"      

   elif [ $md5 == "5db9862819edb16f9ac0f3b1c406e79d" ] #mystery_img1.txt
   then
      
      cat $Archivo | base64 --decode > mystery_img1_decodificado.jpeg
      echo "decodifico completada"

   elif [ $md5 == "b091a841da98ca516635f4dfea1dbaf5" ] #mystery_img2.txt
   then

      cat $Archivo | base64 --decode > mystery_img2_decodificado.jpeg
      echo "decodifico completada"

   elif [ $md5 == "40744679dff4bf36705c00f9cb815579" ] #msg.txt
   then
       cat $Archivo | base64 | base64 > msg_codificado.txt 
       echo "Codificacion completada"
      
   else
       touch "Archivo no valido"
   fi

done
