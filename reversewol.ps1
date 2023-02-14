powershell.exe -WindowStyle Hidden -Command "& '$MyInvocation.MyCommand.Path'"



$client = New-Object System.Net.Sockets.UdpClient(9)
while($true) {
    $remote = new-object System.Net.IPEndPoint([System.Net.IPAddress]::Any,0)
    $received = $client.Receive([ref]$remote)
    # Check if the received packet is a magic packet
    if($received.Length -eq 102 -and ($received[0] -eq 0xFF -and $received[1] -eq 0xFF -and $received[2] -eq 0xFF -and $received[3] -eq 0xFF -and $received[4] -eq 0xFF -and $received[5] -eq 0xFF)) {
    # Get the MAC address of the device in the magic packet
    $packetMAC = [string]::Join(':', ($received[6..11] | % {$_.ToString("X2")}))
    # Compare the MAC address in the packet to the local MAC address
    # Run the shutdown command
    Shutdown /s /t 0
    Start-Sleep -Seconds 15
    New-Item -ItemType file -Path C:\Users\Local2\Desktop\output.txt -Force
    "Script Output" | Out-File C:\Users\Local2\Desktop\output.txt
    }
    Start-Sleep -Seconds 120
    Exit
}
