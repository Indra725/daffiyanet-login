# Daffiyanet — Install file via RouterOS Terminal (raw HTTPS) — Default (index.html)
# Kompatibel: RouterOS v6.40+ & v7
# Cara pakai: paste isi file ini ke New Terminal RouterOS.

:local repoRaw "https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
:local htmlPath "hotspot/login.html"
:local pngPath  "hotspot/logo.png"
:local profileName "default"

/tool fetch mode=https url="$repoRaw/index.html" dst-path=$htmlPath
/tool fetch mode=https url="$repoRaw/logo.png"  dst-path=$pngPath
/ip hotspot profile set [find name=$profileName] login-page=login.html

:log info "Daffiyanet (index) - login.html ter-install, profile '$profileName' login-page=login.html"
