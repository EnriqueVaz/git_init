#!/usr/bin/env bash

function Archivos {

   echo "Que deseas hacer?" 
   echo "[1] Crear directorio"
   echo "[2] Crear archivo" 
   echo "[3] Salir"
   read opc

   case $opc in
      1) 	     	  
         echo "Ingresa el nombre del directorio"
         read nombre
         mkdir $nombre
          echo "Deseas agregar algo al directorio?"
          echo "[1]SI [2]No"
          read agregar
          case $agregar in
            1)
	     cd $nombre      	
             echo "que deseas agregar?"
	     echo "[1]Directorio [2]Archivo"
	     read agregar2
	     if [ $agregar2 -eq 1 ];
	       then
	          echo "ingresa el nombre del directorio"
                  read nombre
                  mkdir $nombre
              elif [ $agregar2 -eq 2 ];
	      then	
                  echo "ingresa el nombre del archivo"
                  read nombre
                  touch $nombre
               else
		  echo "opcion invalida"    	
               fi
             ;;
             2)
               echo "Adios!!"
             ;;
              *)
               echo "Opcion invalida" 
             ;;    
           esac
       ;;
       2)
          echo "ingresa el nombre del archivo"
          read nombre
          touch $nombre
       ;;
       3)
          echo "Adios!!"
       ;;
        *)
          echo "Opcion invalida"
        ;; 
    esac       
}

Archivos