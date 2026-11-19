# Daffiyanet Login Page — Auto Install (Windows PowerShell)
# Requires: ssh.exe (built-in in Windows 10/11) atau OpenSSH yang sudah di-install.
# Cara pakai:
#   .\install.ps1 -Router 192.168.88.1
#   .\install.ps1 -Router 192.168.88.1 -User admin -Profile default
param(
  [Parameter(Mandatory=$true, Position=0)]
  [string]$Router,

  [string]$User = "admin",
  [string]$Profile = "default"
)

$RepoRaw = "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"

$commands = @"
/tool fetch mode=https url="$RepoRaw/index.html" dst-path="hotspot/login.html"
/tool fetch mode=https url="$RepoRaw/logo.png"  dst-path="hotspot/logo.png"
/ip hotspot profile set [find name=$Profile] login-page=login.html
:log info "Daffiyanet login-page ter-install di profil '$Profile'"
"@

Write-Output "Menghubungkan ke $User@$Router via SSH (Anda akan diminta password)..."
$commands | ssh.exe -o StrictHostKeyChecking=no -o UserKnownHostsFile=NUL -o ConnectTimeout=20 "$User@$Router"

if ($LASTEXITCODE -eq 0) {
  Write-Output ""
  Write-Output "Selesai. Uji dari perangkat yang terhubung ke SSID hotspot."
} else {
  Write-Error "Gagal (exit code $LASTEXITCODE). Cek: ssh $User@$Router"
}
