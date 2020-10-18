function ScanRed{

$DireccionIP = Read-Host -prompt "Ingresa el host"
$Port = Read-Host -prompt "Ingresa el puerto a escanear"
$Rango = (1..254)

foreach ($i in $Rango){ 

$ip = “{0}.{1}” –F $host,$i

Write-Progress “Escaneando” $ip -PercentComplete (($i/$Rango.Count)*100)

If(Test-Connection –BufferSize 32 –Count 1 –quiet –ComputerName $ip){ 
   $socket = new-object System.Net.Sockets.TcpClient($ip, $Port)

   If($socket.Connected) { 
   Write-Host “$ip port $Port abierto”
   $socket.Close() 
   }
             
} else { 
     Write-Host “$ip port $Port cerrado ” 
  }

 }
}

scanRed