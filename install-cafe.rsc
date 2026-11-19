# Daffiyanet — Install Tema: Kopi Daffa (cafe.html)
# Kompatibel: RouterOS v6.40+ & v7 (CRS / CCR / hAP / hEX / RB-series)
# Cara pakai: buka New Terminal RouterOS, paste seluruh isi file ini.

:local repoRaw "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
:local htmlPath "hotspot/cafe.html"
:local pngPath  "hotspot/logo.png"
:local profileName "default"

/tool fetch mode=https url="$repoRaw/cafe.html" dst-path=$htmlPath
/tool fetch mode=https url="$repoRaw/logo.png"  dst-path=$pngPath
/ip hotspot profile set [find name=$profileName] login-page=cafe.html

:log info "Kopi Daffa - cafe.html ter-install, profile '$profileName' login-page=cafe.html"
