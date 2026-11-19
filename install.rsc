# Daffiyanet Login Page — Auto install ke MikroTik Hotspot
# Compatible: RouterOS v6.40+ & RouterOS v7 (CCR / CRS / hAP / hEX / RB-series)
# Cara pakai (2 opsi):
#   A. Upload file ini ke router (via Winbox → Files), lalu ketik:
#      /import file-name=install.rsc
#   B. Paste isi file ini langsung ke New Terminal router, tekan Enter.

:local repoRaw "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
:local htmlPath "hotspot/login.html"
:local pngPath  "hotspot/logo.png"
:local profileName "default"

/tool fetch mode=https url="$repoRaw/index.html" dst-path=$htmlPath
/tool fetch mode=https url="$repoRaw/logo.png"  dst-path=$pngPath
/ip hotspot profile set [find name=$profileName] login-page=login.html

:log info "Daffiyanet login-page tersedia di $htmlPath — profile '$profileName' login-page=login.html"
