# Daffiyanet — MikroTik Universal Login Page

Halaman login captive portal universal untuk **MikroTik Hotspot** — siap dipakai di berbagai perangkat/OS (Windows, Android, iPhone/iPad, macOS, Linux) — desain modern, cepat, tanpa dependency berat.

![Logo](logo.png)

## Tema yang tersedia

| File | Tema | Cocok untuk | Highlight |
|---|---|---|---|
| `index.html` | Daffiyanet (utama) | RT-RW-Net / ISP lokal | Paket internet + OS tabs + QRIS |
| `cafe.html` | Kopi Daffa | Café / kedai kopi | Menu andalan + suasana hangat + form login WiFi |
| `sekolah.html` | SMPN 1 | Sekolah / kampus | Pengumuman akademik + form login siswa/guru |
| `salon.html` | Salon Daffa Beauty | Salon / spa / barbershop | Price list + WhatsApp booking + form login klien |

Semua halaman:
- Form login dengan kompatibel `$(link-login-only)` & `$(link-orig)`
- Tema gelap modern (curl / cream / plum) — **tidak jadul**
- Responsive (mobile & desktop)
- Bahasa Indonesia
- Info donasi a/n **Daffiyanet** (08516163719)

## Cara pakai di MikroTik Hotspot

**Opsi A — via Winbox (paling mudah)**
1. Upload file yang Anda inginkan (mis. `cafe.html`) ke `flash/hotspot/`.
2. Set login page hotspot profile:
   ```
   /ip hotspot profile set [find name=default] login-page=cafe.html
   ```
3. Uji dari perangkat yang terhubung ke SSID hotspot.

**Opsi B — via Terminal router / import `install.rsc`**
1. Upload `install.rsc` ke router via Winbox (Files), atau paste isinya ke New Terminal.
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

Setelah terinstal, buka browser dari perangkat yang terhubung ke SSID hotspot — halaman akan muncul otomatis.

## Per-theme install (sekali klik, langsung di router)

Setiap tema punya file `install-*.rsc` sendiri yang otomatis download & aktif di router:

| File Halaman | Install `.rsc` | Tombol RouterOS Terminal |
|---|---|---|
| `index.html` (Daffiyanet) | [install.rsc](https://github.com/Indra725/daffiyanet-login/blob/main/install.rsc) | Paste → Enter |
| `cafe.html` (Kopi Daffa) | [install-cafe.rsc](https://github.com/Indra725/daffiyanet-login/blob/main/install-cafe.rsc) | Paste → Enter |
| `sekolah.html` (SMPN 1) | [install-sekolah.rsc](https://github.com/Indra725/daffiyanet-login/blob/main/install-sekolah.rsc) | Paste → Enter |
| `salon.html` (Salon Daffa Beauty) | [install-salon.rsc](https://github.com/Indra725/daffiyanet-login/blob/main/install-salon.rsc) | Paste → Enter |

## Download halaman secara manual

| File | Download mentah (raw) |
|---|---|
| `index.html` | [`https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/index.html`](https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/index.html) |
| `cafe.html` | [`https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/cafe.html`](https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/cafe.html) |
| `sekolah.html` | [`https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/sekolah.html`](https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/sekolah.html) |
| `salon.html` | [`https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/salon.html`](https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/salon.html) |
| `logo.png` | [`https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/logo.png`](https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/logo.png) |

## Kustomisasi

| Bagian | File & lokasi | Cara ubah |
|---|---|---|
| Nama toko & sapaan | masing-masing `.html` bagian `<header>` | Edit teks |
| Menu café / pengumuman sekolah / price list salon | dalam `<section class="hero">` | Edit konten |
| Harga paket (utama) | `index.html` → `<div class="packages">` | Edit 3 div `.pkg` |
| Logo | `logo.png` | Ganti dengan logo Anda (44×44) |
| Info donasi | masing-masing file, bagian `.donate` | Edit nomor/nama |
| Form login | bagian `<form>` | Jangan ubah variabel `$(...)` |

## Kebutuhan

- MikroTik **RouterOS v6.40+** atau **v7.x** (CRS, CCR, hAP, hEX, RB-series)
- Paket **Hotspot** aktif
- Akses admin (winbox/ssh/terminal)

## Lisensi

MIT — lihat berkas `LICENSE`.
