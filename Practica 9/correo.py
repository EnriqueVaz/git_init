#!/usr/bin/env python3

import smtplib
import json
import argparse
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

parser = argparse.ArgumentParser()

parser.add_argument("-error", type=str, help="error= 0 proceso terminado con exito, error= 1 			 			     hubo un fallo")
parser.add_argument("-user", type=str, help="direccion del usuario")
parser.add_argument("-pasw", type=str, help="contrasenia del usuario")
parser.add_argument("-to", type=str, help="direccion del destinatario")

params = parser.parse_args()

error = params.error
user = params.user
pasw = params.pasw
to = params.to

msg = MIMEMultipart()
 
if error == "0":
   message = "Proceso terminado con exito"
   msg['Subject'] = "Sin error"
   
elif error == "1":
   message = "Error al terminar el proceso"
   msg['Subject'] = "Con error"
 
msg['From'] = user 
msg['To'] = to
 
# add in the message body
msg.attach(MIMEText(message, 'plain'))

#create server
server = smtplib.SMTP('smtp.office365.com:587')

server.starttls()
 
# Login Credentials for sending the mail
print(user)
server.login(user,pasw)
 
# send the message via the server.
server.sendmail(msg['From'], msg['To'], msg.as_string())

server.quit()

print("successfully sent email to %s:" % (msg['To']))
