
function Procesos{
  $i=1
while($i-eq 1){ 
$opc = Read-Host -Prompt "Que deseas hacer? [1]Ver Procesos  [2]Iniciar una aplicacion  [3]Cerrar una aplicacion [4]Salir"  
  switch($opc){
     1 {
     $Proceso = Read-Host -Prompt "[1]Ver todos los procesos [2]Ver un proceso en especifico" 
      switch($Proceso){
        1{
          Get-Process
        } 2 {
          $programa = Read-Host -Prompt "Ingresa el programa"
          Get-Process -name $programa 
        } default{
          " No es una opcion valida"
        }
      }  
     } 2 {
        $programa = Read-Host -Prompt "Ingresa el programa a iniciar"
        Start-Process $programa
        Write-Host "Programa iniciado!!" 
     } 3 {
        $programa = Read-Host -Prompt "Ingresa el programa que quieras cerrar"
        Stop-Process -name $programa
        Write-Host "Programa Finalizado!!"
     } 4 {
       $i = $i + 1
     }default{
        Write-Host "no es una opcion valida" 
     }     
   }  
 }    
}
 Procesos
