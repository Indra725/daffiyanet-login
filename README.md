# Daffiyanet — MikroTik Universal Login Page

Halaman login captive portal universal untuk **MikroTik Hotspot** — siap dipakai di berbagai perangkat/OS (Windows, Android, iPhone/iPad, macOS, Linux) — desain modern, cepat, tanpa dependency berat.

![Logo](logo.png)

## Tema yang tersedia

| File | Tema | Cocok untuk | Highlight |
|---|---|---|---|
| `index.html` | Daffiyanet (utama) | RT-RW-Net / ISP lokal | Paket internet + OS tabs + QRIS |
| `cafe.html` | Kopi Daffa | Café / kedai kopi | Menu andalan + suasana hangat |
| `sekolah.html` | SMPN 1 | Sekolah / kampus | Pengumuman & jadwal akademik |
| `salon.html` | Salon Daffa Beauty | Salon / spa / barbershop | Price list + WhatsApp booking |
| `minimarket.html` | Mini Mart Jaya | Minimarket | Promo member + paket sembako |
| `pesantren.html` | Ponpes Daffa | Pesantren / masjid | Jadwal sholat & kajian |
| `kelontong.html` | Toko Kelontong | Toko kelontong | Katalog + diskon member |
| `warnet.html` | WarKom | Warnet / cyber café | Paket game + neon gaming theme |
| `klinik.html` | Klinik Daffa Sehat | Klinik / praktek dokter | Jadwal dokter + form pasien |
| `hotel.html` | Hotel Daffa Palace | Hotel / penginapan | Fasilitas 5★ + form tamu |
| `newyear.html` | Tahun Baru 2027 | Momen pergantian tahun / Natal & Tahun Baru | Fireworks canvas + snow + countdown interaktif |

Semua tema:
- Form login dengan kompatibel `$(link-login-only)` & `$(link-orig)`
- Tema modern — **tidak jadul**
- Responsive (mobile & desktop), Bahasa Indonesia
- Info donasi a/n **Daffiyanet** (08516163719)
- File langsung bisa di-fetch ke MikroTik lewat URL raw (lihat tabel per-tema)

## Per-theme install (RouterOS Terminal)

| Tema | File `.rsc` |
|---|---|
| `index.html` | [`install.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install.rsc) |
| `cafe.html` | [`install-cafe.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-cafe.rsc) |
| `sekolah.html` | [`install-sekolah.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-sekolah.rsc) |
| `salon.html` | [`install-salon.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-salon.rsc) |
| `minimarket.html` | [`install-minimarket.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-minimarket.rsc) |
| `pesantren.html` | [`install-pesantren.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-pesantren.rsc) |
| `kelontong.html` | [`install-kelontong.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-kelontong.rsc) |
| `warnet.html` | [`install-warnet.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-warnet.rsc) |
| `klinik.html` | [`install-klinik.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-klinik.rsc) |
| `hotel.html` | [`install-hotel.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-hotel.rsc) |
| `newyear.html` | [`install-newyear.rsc`](https://github.com/Indra725/daffiyanet-login/blob/main/install-newyear.rsc) |

Cara pakai: buka **Winbox → New Terminal**, paste seluruh isi salah satu `install-*.rsc`, tekan **Enter** — file HTML + logo akan di-download ke folder `hotspot/`, dan profile `default` akan menggunakan file tersebut sebagai `login-page`.

## Link download langsung (raw)

| File | URL |
|---|---|
| `index.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/index.html |
| `cafe.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/cafe.html |
| `sekolah.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/sekolah.html |
| `salon.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/salon.html |
| `minimarket.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/minimarket.html |
| `pesantren.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/pesantren.html |
| `kelontong.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/kelontong.html |
| `warnet.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/warnet.html |
| `klinik.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/klinik.html |
| `hotel.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/hotel.html |
| `newyear.html` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/newyear.html |
| `logo.png` | https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/logo.png |

## Cara pakai di MikroTik Hotspot

**Opsi A — via Winbox (paling mudah)**
1. Upload `index.html` & `logo.png` (atau tema pilihan Anda) ke folder `hotspot/` via Winbox (Files).
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

**Opsi E — via `/tool fetch` langsung dari RouterOS**
```
/tool fetch mode=https url="https://raw.githubusercontent.com/Indra725/daffiyanet-login/main/cafe.html" dst-path="hotspot/cafe.html"
```

Setelah terinstal, buka browser dari perangkat yang terhubung ke SSID hotspot — halaman akan muncul otomatis.

## Kebutuhan

- MikroTik **RouterOS v6.40+** atau **v7.x** (CRS, CCR, hAP, hEX, RB-series)
- Paket **Hotspot** aktif
- Akses admin (winbox/ssh/terminal)

## Lisensi

MIT — lihat berkas `LICENSE`.
