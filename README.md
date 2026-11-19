# Daffiyanet — MikroTik Universal Login Page

Halaman login captive portal universal untuk **MikroTik Hotspot** — siap dipakai di berbagai perangkat/OS (Windows, Android, iPhone/iPad, macOS, Linux) — desain modern, cepat, tanpa dependency berat.

![Logo](logo.png)

## Fitur

- Login form kompatibel dengan **MikroTik Hotspot** (variabel `$(link-login-only)` & `$(link-orig)` otomatis diisi)
- Instruksi koneksi/autoupdate DHCP per OS dalam 5 tab interaktif (tanpa reload)
- 3 paket harga yang mudah diedit langsung di `index.html`
- Info donasi (E-Wallet **08516163719** a/n Daffiyanet, QRIS via `billingservices.daffiyanet.my.id/donate`)
- Satu file mandiri (`index.html` + `logo.png`) — cocok di-upload ke `flash/hotspot/` MikroTik
- Responsive (mobile & desktop), tema gelap modern, Bahasa Indonesia
- Skrip auto-install siap pakai: `install.rsc` (RouterOS), `install.sh` (Linux/macOS), `install.ps1` (Windows)

## Struktur repo

```
.
├── index.html       # Halaman login (mandiri, inline CSS+JS)
├── logo.png         # Logo Daffiyanet
├── install.rsc      # Auto install via RouterOS Terminal / /import
├── install.sh       # Auto install via SSH (Linux/macOS)
├── install.ps1      # Auto install via SSH (Windows PowerShell)
├── LICENSE          # MIT
└── README.md        # File ini
```

## Cara pakai di MikroTik Hotspot

**Opsi A — via Winbox (paling mudah)**
1. Upload `index.html` & `logo.png` ke folder `hotspot/` via Winbox (Files).
2. Set login page hotspot profile:
   ```
   /ip hotspot profile set [find name=default] login-page=login.html
   ```
3. Uji dari perangkat terhubung ke SSID hotspot.

**Opsi B — via Terminal router / import `install.rsc`**
1. Upload `install.rsc` ke router lewat Winbox (Files) atau paste isinya langsung ke New Terminal.
2. Ketik:
   ```
   /import file-name=install.rsc
   ```

**Opsi C — dari Linux / macOS (shell)**
```bash
chmod +x install.sh
./install.sh -r 192.168.88.1 -u admin         # akan diminta password
./install.sh -r 192.168.88.1 -u admin -p pass # butuh sshpass
```

**Opsi D — dari Windows PowerShell**
```powershell
.\install.ps1 -Router 192.168.88.1 -User admin
```

Setelah terinstal, buka browser dari perangkat yang terhubung ke SSID hotspot — halaman Daffiyanet akan muncul otomatis.

## Kustomisasi

| Bagian | Lokasi | Cara ubah |
|---|---|---|
| Harga paket | `<div class="packages">` | Edit 3 div `.pkg` (nama, harga, kecepatan) |
| Info donasi | `.donate` | Edit nomor/nama/e-wallet sesuai kebutuhan |
| Logo | `logo.png` | Ganti dengan logo ISP Anda |
| Kontak / nomor HP | `.sub`, `.trust`, footer | Edit teks |
| OS tabs / instruksi | JS array `OS` | Edit daftar di `<script>` |
| Profile MikroTik | form `action`, `$(...)` | Jangan diubah kecuali paham Hotspot |

## Kebutuhan

- MikroTik **RouterOS v6.40+** atau **v7.x** (CRS, CCR, hAP, hEX, RB-series)
- Paket **Hotspot** aktif
- Akses admin (winbox/ssh/terminal)

## Lisensi

MIT — lihat berkas `LICENSE`.
