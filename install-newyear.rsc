# Daffiyanet — Install Tema: Voucher Hotspot (newyear.html)
# Kompatibel: RouterOS v6.40+ & v7 (CRS / CCR / hAP / hEX / RB-series)
# Cara pakai: paste isi file ini ke New Terminal RouterOS.

:local repoRaw "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
:local htmlPath "hotspot/newyear.html"
:local pngPath  "hotspot/logo.png"
:local profileName "default"

/tool fetch mode=https url="$repoRaw/newyear.html" dst-path=$htmlPath
/tool fetch mode=https url="$repoRaw/logo.png"  dst-path=$pngPath
/ip hotspot profile set [find name=$profileName] login-page=newyear.html

:log info "Voucher Hotspot - newyear.html ter-install, profile '$profileName' login-page=newyear.html"
