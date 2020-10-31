import requests
import re
import os
from bs4 import BeautifulSoup
import argparse


#Ingresar la url "-url URL"
#url de ejemplo https://www.muylinux.com/2017/03/08/microsoft-office-linux-2/  
parser = argparse.ArgumentParser()
parser.add_argument("-url", type=str, help="url del sitio web", required=True)
params = parser.parse_args()

def down_image(url):
   #Expresion para buscar el inicio de la url hasta antes del ultimo '/'
   exp_url = re.compile(r'http(s)?://\w*.\w*.\w*')
   #Se busca lo anterior con el metodo search
   res = exp_url.search(url) 
   #Se encarga de transformar la url a html
   response = requests.get(url)  
   #Recibe la url
   soup = BeautifulSoup(response.content, "html.parser")
   #Busca en las imagenes en el html
   images = soup.find_all("img")
   #Se crea la carpeta images
   os.mkdir("images")
   i = 1
   for image in images:
      #Se guardan los enlaces en la variable t
      link = image.get("src")
      #Se crea el nombre y donde se van a guardar las imagenes
      imagename = "images" + "/" + "image" + str(i)+ ".jpg"

      #Descarga de las imagenes
      with open(imagename, "wb")as file:
         res_link = exp_url.search(link)
         try:
            print(res_link.group())
         except:
            link = str(res.group()) + link
            print(link)
         file.write(requests.get(link).content)

      i += 1

url = params.url
down_image(url)
