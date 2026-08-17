# 🖥️ Panduan Install Kali Linux / Ubuntu di VMware

VMware Workstation/Player tidak punya perintah command-line gratis sekelas `VBoxManage`, jadi setup di sini dilakukan manual lewat GUI. Ikuti langkah berikut untuk kedua OS.

## 1. Download ISO Resmi
- Kali Linux → https://www.kali.org/get-kali/
- Ubuntu Desktop → https://ubuntu.com/download/desktop

Selalu cek checksum SHA256 ISO yang kamu download dengan yang tertera di website resmi.

## 2. Buat VM Baru
1. Buka VMware Workstation/Player → **Create a New Virtual Machine**
2. Pilih **Installer disc image file (iso)** → arahkan ke ISO yang sudah didownload
3. VMware biasanya otomatis mendeteksi OS-nya (Easy Install untuk Ubuntu)

## 3. Isi Kredensial (khusus Ubuntu, via Easy Install)
Saat VMware mendeteksi ISO Ubuntu, akan muncul form **Easy Install**. Isi:
- **Full name:** PutraMods
- **User name:** `putramods`
- **Password:** `PutraMods2026!` (ganti sesuai kebutuhan)

Untuk Kali Linux, Easy Install biasanya tidak tersedia — lanjutkan instalasi manual seperti biasa, dan gunakan kredensial default installer: `kali` / `kali`.

## 4. Atur Resource VM
Sebelum start, klik **Customize Hardware**:
- RAM: minimal 4 GB
- CPU: minimal 2 core
- Disk: minimal 40 GB
- Network Adapter: **NAT** (lebih aman daripada Bridged untuk pemula)

## 5. Start & Selesaikan Instalasi
Klik **Finish/Power On**, tunggu proses instalasi selesai otomatis (Ubuntu) atau ikuti wizard (Kali).

## 🔒 Tips Keamanan
- Aktifkan **Snapshot** (Menu → VM → Snapshot → Take Snapshot) sebelum bereksperimen
- Jangan aktifkan **Shared Folder** ke drive penting host tanpa perlu
- Gunakan mode jaringan **NAT**, bukan **Bridged**, kecuali kamu paham resikonya
- 
