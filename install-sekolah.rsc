# Daffiyanet — Install Tema: SMPN 1 (sekolah.html)
# Kompatibel: RouterOS v6.40+ & v7 (CRS / CCR / hAP / hEX / RB-series)
# Cara pakai: buka New Terminal RouterOS, paste seluruh isi file ini.

:local repoRaw "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
:local htmlPath "hotspot/sekolah.html"
:local pngPath  "hotspot/logo.png"
:local profileName "default"

/tool fetch mode=https url="$repoRaw/sekolah.html" dst-path=$htmlPath
/tool fetch mode=https url="$repoRaw/logo.png"  dst-path=$pngPath
/ip hotspot profile set [find name=$profileName] login-page=sekolah.html

:log info "SMPN 1 - sekolah.html ter-install, profile '$profileName' login-page=sekolah.html"
