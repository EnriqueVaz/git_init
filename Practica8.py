from ftplib import FTP
import os

#Conexion al contenedor ftp de forma anonima
ftp = FTP("ftp.us.debian.org")
ftp.login()

#se encarga de buscar los archivos con texto dentro del directorio y copiarlos
def Copy():
  
   comprobar=[]
   
   #lo agregue para probar la funcion Copy
   ftp.cwd("/debian/")

   #se crea la carpeta donde se van a guardar los archivos
   if os.path.isdir("TXT"):
      pass
   else:
      os.mkdir("TXT")

   ftp.dir("*.msg", comprobar.append)
   cont = len(comprobar)
   if cont != 0:
      for i in range(cont):
          archivo=comprobar[i][56:90]
          archivo=archivo.strip()
          with open("TXT/"+str(archivo), "wb") as fp:
             ftp.retrbinary("RETR " + str(archivo), fp.write)
   else:
      pass
   comprobar=[]

   ftp.dir("*.txt", comprobar.append)
   cont = len(comprobar)
   if cont != 0:
      for i in range(cont):
          archivo=comprobar[i][56:90]
          archivo=archivo.strip()
          with open("TXT/"+str(archivo), "wb") as fp:
             ftp.retrbinary("RETR " + str(archivo), fp.write)
   else:
      pass
   comprobar=[]

   
   ftp.dir("*README", comprobar.append)
   cont = len(comprobar)
   if cont != 0:
      for i in range(cont):
          archivo=comprobar[i][56:90]
          archivo=archivo.strip()
          with open("TXT/"+str(archivo), "wb") as fp:
             ftp.retrbinary("RETR " + str(archivo), fp.write)
   else:
      pass
   comprobar=[]
   cont = len(comprobar)
   ftp.dir("*html", comprobar.append)
   if cont != 0:
      for i in range(cont): 
          archivo=comprobar[i][56:90]
          archivo=archivo.strip()
          with open("TXT/"+str(archivo), "wb") as fp:
             ftp.retrbinary("RETR " + str(archivo), fp.write)
   else:
      pass

   return 0


#Esta parte me dio ansiedad :((
#empieza bien pero entra en un bucle infinito 
def searchDir():
  try:
    ls=[]
    lsDir=[]
    dics=[]
    remove=[]
    z = 0
    j = 0
    ftp.retrlines("LIST",ls.append)
    lsDir.append([line for line in ls if line.startswith("dr")])
    lsDir.append([line for line in ls if line.startswith("l")])
 
    for x in range(len(lsDir)):       
      lon= len(lsDir[x])
      actualDic=ftp.pwd()   
      if lon > 0:
         for j in range(lon):
           dic=lsDir[x][j][56:95]
           num=dic.find("->")
           print("numero de directorios : " + str(lon))
           if num > 0:
               dic= dic[0:num]
               dic=dic.strip()
               if dic in remove:
                  pass
               else:
                  print(dic)
                  dics.append(dic)
           else:
               if dic in remove:
                  pass
               else:
                  print(dic)
                  dics.append(dic)

      elif lon == 1:
         for j in range(lon):
           dic=lsDir[x][j][56:95]
           num=dic.find("->")
           print("numero de directorios : " + str(lon))
           if num > 0:
               dic= dic[0:num]
               dic=dic.strip()
               if dic in remove:
                  pass
               else:
                  print(dic)
                  dics.append(dic)
           else:
               if dic in remove:
                  pass
               else:
                  print(dic)
                  dics.append(dic)    
         remove.append(dic)
         fpt.cwd("..")
         ftp.cwd("..")

    print(dics)
    ftp.cwd(str(dics[0]))
    searchDir()
  except:
   print("bip bip error")
   remove.append(dic)
   ftp.cwd("..")
   ftp.cwd("..")
   searchDir() 
 
#La funcion Copy si sirve  
Copy()
#searchDir()
ftp.quit()

