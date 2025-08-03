<#
.SYNOPSIS
  Network Tools Pack - Basic troubleshooting and info gathering.

.DESCRIPTION
  This toolkit provides essential network utilities for IT support and diagnostics.
  Tools: Ping, DNS, Port Scanner, Traceroute, Public IP, IP Config

.NOTES
  Author: David Sakai
  Version: 1.0
#>

function Show-Menu {
    Clear-Host
    Write-Host "=== NETWORK TOOLS MENU ===" -ForegroundColor Cyan
    Write-Host "1. Ping Test"
    Write-Host "2. DNS Lookup"
    Write-Host "3. Port Scanner"
    Write-Host "4. Show IP Configuration"
    Write-Host "5. Get Public IP"
    Write-Host "6. Traceroute"
    Write-Host "0. Exit"
    Write-Host "==========================="
}

function Ping-Test {
    $target = Read-Host "Enter hostname or IP to ping"
    Test-Connection -ComputerName $target -Count 4 | Format-Table -AutoSize
}

function DNS-Lookup {
    $domain = Read-Host "Enter domain to resolve"
    try {
        Resolve-DnsName $domain | Format-Table Name, Type, IPAddress -AutoSize
    } catch {
        Write-Warning "❌ Failed to resolve: $domain"
    }
}

function Port-Scanner {
    $host = Read-Host "Enter host to scan"
    $ports = 20..1024
    foreach ($port in $ports) {
        try {
            $tcp = New-Object Net.Sockets.TcpClient
            $tcp.Connect($host, $port)
            if ($tcp.Connected) {
                Write-Host "✅ Port $port is OPEN" -ForegroundColor Green
                $tcp.Close()
            }
        } catch {
            # Port closed
        }
    }
}

function Show-IPConfig {
    ipconfig /all
}

function Get-PublicIP {
    try {
        $ip = Invoke-RestMethod -Uri "https://api.ipify.org?format=json"
        Write-Host "🌍 Public IP: $($ip.ip)" -ForegroundColor Cyan
    } catch {
        Write-Warning "❌ Could not retrieve public IP."
    }
}

function Run-Traceroute {
    $host = Read-Host "Enter hostname or IP for traceroute"
    tracert $host
}

# === Main Loop ===
do {
    Show-Menu
    $choice = Read-Host "Choose an option"
    switch ($choice) {
        1 { Ping-Test }
        2 { DNS-Lookup }
        3 { Port-Scanner }
        4 { Show-IPConfig }
        5 { Get-PublicIP }
        6 { Run-Traceroute }
        0 { Write-Host "Exiting..." }
        default { Write-Warning "Invalid selection. Try again." }
    }
    if ($choice -ne 0) { Pause }
} while ($choice -ne 0)
