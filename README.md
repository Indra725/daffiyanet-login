# Daffiyanet — MikroTik Universal Login Page

Halaman login captive portal universal untuk **MikroTik Hotspot** yang siap dipakai di berbagai perangkat/OS (Windows, Android, iPhone/iPad, macOS, Linux) — desain modern, cepat, tanpa dependency berat.

![Logo](logo.png)

## Fitur

- Login form kompatibel dengan **MikroTik Hotspot** (variabel `$(link-login-only)` & `$(link-orig)` otomatis diisi)
- Instruksi DHCP per OS dalam 5 tab interaktif (tanpa reload)
- 3 paket harga yang bisa diedit (`index.html` → `.packages`)
- Info donasi (E-Wallet **08516163719** a/n Daffiyanet, QRIS di `billingservices.daffiyanet.my.id/donate`)
- Satu file mandiri (`index.html` + `logo.png`) — cocok di-upload ke `flash:/hotspot/` MikroTik
- Responsive (mobile & desktop), tema gelap modern, locale **Bahasa Indonesia**

## Struktur repo

```
.
├── index.html      # Halaman login (mandiri, inline CSS+JS)
├── logo.png        # Logo Daffiyanet
├── LICENSE         # MIT
└── README.md       # File ini
```

## Cara pakai di MikroTik Hotspot

1. Siapkan Hotspot MikroTik & upload file:
   ```
   ssh admin@router
   /file print
   # Upload file via Winbox (Files → masuk ke folder hotspot) atau via FTP
   # cp index.html hotspot/login.html
   ```
2. Set login page Hotspot agar memakai file ini:
   ```
   /ip hotspot profile
   set [find name=default] login-by=cookie,http-chap login-page=login.html
   ```
3. Uji dari perangkat yang terhubung ke SSID Hotspot — halaman otomatis muncul saat pertama membuka browser.

## Cara pakai (lokal / preview)

Cukup double-click `index.html` atau buka lewat browser.
Bagian login akan tetap terlihat (action form pakai placeholder `link-login-only`).

## Kustomisasi

| Bagian | Lokasi | Cara ubah |
|---|---|---|
| Harga paket | `<div class="packages">` | Edit 3 div `.pkg` (nama, harga, kecepatan) |
| Info donasi | `.donate` | Edit nomor/nama/e-wallet sesuai kebutuhan |
| Logo | `logo.png` | Ganti dengan logo ISP Anda |
| Kontak/nomor HP | `.sub`, `.trust`, footer | Edit teks |
| Propterties MikroTik | form `action`, `$(...)` | Jangan diubah kecuali paham Hotspot |

## Lisensi

MIT — lihat berkas `LICENSE`.
