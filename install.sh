#!/usr/bin/env bash
# Daffiyanet Login Page — Auto Install (Linux & macOS)
# Requires: ssh, dan opsional: sshpass (untuk --password)
set -euo pipefail

usage() {
  cat <<'EOF'
Daffiyanet Login Page — Auto Install ke MikroTik Hotspot

Contoh:
  ./install.sh -r 192.168.88.1 -u admin
  ./install.sh -r 192.168.88.1 -u admin -p password -P default

Argumen:
  -r <ip>        IP router (wajib)
  -u <user>      Username RouterOS (default: admin)
  -p <password>  Password RouterOS (jika kosong: prompt manual)
  -P <profile>   Nama hotspot profile (default: "default")
  -h             Bantuan
EOF
}

ROUTER=""; RUSER="admin"; RPASS=""; PROFILE="default"
while getopts "r:u:p:P:h" opt; do
  case "$opt" in
    r) ROUTER=$OPTARG ;; u) RUSER=$OPTARG ;; p) RPASS=$OPTARG ;; P) PROFILE=$OPTARG ;;
    h|*) usage; exit 0 ;;
  esac
done
: "${ROUTER:?WAJIB: -r <ip-atau-host>}"

REPO_RAW="https://raw.githubusercontent.com/Indra725/daffiyanet-login/main"
COMMANDS=$(cat <<EOF
/tool fetch mode=https url="$REPO_RAW/index.html" dst-path="hotspot/login.html"
/tool fetch mode=https url="$REPO_RAW/logo.png"  dst-path="hotspot/logo.png"
/ip hotspot profile set [find name=${PROFILE}] login-page=login.html
:log info "Daffiyanet login-page ter-install di profil '${PROFILE}'"
EOF
)

SSHOPT="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=15"
if [ -n "$RPASS" ] && command -v sshpass >/dev/null 2>&1; then
  echo "→ Menggunakan sshpass..."
  printf '%s\n' "$COMMANDS" | sshpass -p "$RPASS" ssh $SSHOPT "${RUSER}@${ROUTER}"
else
  echo "→ sshpass tidak tersedia atau password tidak diset; login interaktif..."
  printf '%s\n' "$COMMANDS" | ssh $SSHOPT "${RUSER}@${ROUTER}"
fi
echo "Selesai. Uji dari perangkat yang terhubung ke SSID hotspot."
