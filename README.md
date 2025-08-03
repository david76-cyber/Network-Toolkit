# 🌐 Network Toolkit (PowerShell)

A compact and powerful PowerShell script for common network diagnostics and analysis tasks. Designed for IT students, helpdesk techs, or system administrators who want a fast way to gather and test network information from the terminal.

---

## 🔧 Features

- 🔍 **IP Configuration Summary**
- 🌍 **Public IP Discovery**
- 🛰️ **Ping Test (Custom Host)**
- 🧭 **DNS Lookup**
- 🛜 **Port Scanner (TCP)**
- 📶 **Traceroute to Destination**
- 🧪 **Internet Connectivity Check**
- 📄 **Exportable Log Output**

---

## 🖥️ Example Usage

```powershell
.\Network-Toolkit.ps1

The script will present you with a menu or perform predefined checks depending on how it's structured. Make sure to run PowerShell as Administrator for full functionality (especially port scanning or network interfaces access).

📦 Requirements
✅ PowerShell 5.1+ (Windows)

🧠 Administrator privileges (recommended)

🌐 Internet connection (for some tests)

📁 Sample Output
less
Copy
Edit
Network Toolkit v1.0 by David Sakai
-------------------------------------
[✔] IP Configuration: 192.168.1.23
[✔] Public IP: 203.0.113.45
[✔] Ping google.com - Success
[✔] DNS Lookup google.com - 142.250.72.14
[✔] Port 22 on 192.168.1.1 - Closed
[✔] Traceroute to 8.8.8.8 - 12 hops
[✔] Internet Connection: Available
🧰 Modular Functions (Example)
Get-IPConfig

Get-PublicIP

Test-InternetConnection

Invoke-PingTest

Invoke-DNSLookup

Start-PortScan

Invoke-Traceroute

🔐 Security Notice
This script is read-only and diagnostic. It does not change your system configuration. However, port scanning may trigger alerts on some networks—use responsibly.

