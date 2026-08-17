<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f0f0f,100:1a1a1a&height=200&section=header&text=PutraMods%20VM%20Installer&fontSize=36&fontColor=39FF14&fontAlign=50&fontAlignY=38&desc=Kali%20Linux%20%26%20Ubuntu%20Setup%20Toolkit&descAlign=50&descAlignY=58&descColor=B5B5B5&animation=fadeIn" width="100%"/>

<p>
  <img src="https://img.shields.io/badge/Platform-VirtualBox%20%7C%20VMware-0f0f0f?style=for-the-badge&logo=virtualbox&logoColor=39FF14"/>
  <img src="https://img.shields.io/badge/Shell-Bash-0f0f0f?style=for-the-badge&logo=gnubash&logoColor=39FF14"/>
  <img src="https://img.shields.io/badge/License-MIT-0f0f0f?style=for-the-badge"/>
</p>

<p>
  <a href="https://wa.me/6281330881417"><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a>
  <a href="https://github.com/PutraWibu"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/></a>
  <a href="https://www.youtube.com/@putramods21"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white"/></a>
</p>

</div>

## 📖 Tentang Project

**PutraMods VM Installer** adalah kumpulan script otomatis untuk membuat Virtual Machine **Kali Linux** dan **Ubuntu** di **VirtualBox**, lengkap dengan panduan manual untuk **VMware**. Dibuat supaya proses install VM jadi cepat, rapi, dan **tidak menyentuh sistem asli (host)** — semua terisolasi di dalam virtual machine.

> ⚠️ Semua script di sini hanya membuat & mengonfigurasi VM. Tidak ada yang memodifikasi sistem operasi utama (host) kamu.

<br/>

## 📁 Struktur Project

```
PutraMods-VM-Installer/
├── README.md
├── LICENSE
├── scripts/
│   ├── create-kali-vm.sh      # Buat VM Kali Linux (VirtualBox)
│   └── create-ubuntu-vm.sh    # Buat VM Ubuntu otomatis (VirtualBox, unattended install)
└── docs/
    └── vmware-guide.md        # Panduan manual install di VMware
```

<br/>

## ✅ Prasyarat

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) sudah terinstall (buat script `.sh` di sini)
- ISO resmi **Kali Linux** → [kali.org/get-kali](https://www.kali.org/get-kali/)
- ISO resmi **Ubuntu Desktop** → [ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)
- Minimal **40 GB** ruang kosong di disk + RAM host minimal 8 GB (biar VM tetap lancar dipakai bareng host)
- **Selalu download ISO dari situs resmi** dan cek checksum (SHA256) yang tertera di website resminya — jangan pakai ISO dari sumber tidak jelas.

<br/>

## 🚀 Cara Pakai — Kali Linux

```bash
chmod +x scripts/create-kali-vm.sh
./scripts/create-kali-vm.sh /path/ke/kali-linux-installer.iso
```

Script ini akan:
1. Membuat VM baru bernama `PutraMods-Kali`
2. Alokasi 4 GB RAM, 2 CPU, disk 40 GB (bisa diubah lewat variabel di awal file)
3. Attach ISO Kali dan langsung boot VM ke installer (kamu lanjutkan instalasi seperti biasa lewat GUI)

**Kredensial default Kali (live/installer):**
| Username | Password |
|---|---|
| `kali` | `kali` |

> Ganti password ini setelah instalasi selesai, terutama kalau VM akan sering dipakai.

<br/>

## 🚀 Cara Pakai — Ubuntu (Otomatis / Unattended)

```bash
chmod +x scripts/create-ubuntu-vm.sh
./scripts/create-ubuntu-vm.sh /path/ke/ubuntu-desktop.iso
```

Script ini pakai fitur `VBoxManage unattended install`, jadi VM akan **terinstall otomatis** tanpa perlu klik-klik manual, dengan akun default:

| Username | Password | Hostname |
|---|---|---|
| `putramods` | `PutraMods2026!` | `putramods-ubuntu.local` |

> Ganti `USERNAME`/`PASSWORD` di bagian atas file `create-ubuntu-vm.sh` sebelum dijalankan kalau mau kredensial lain.

<br/>

## 🖥️ Install di VMware

VMware Workstation/Player nggak punya perintah command-line resmi segampang VirtualBox, jadi untuk VMware disediakan panduan manual step-by-step → lihat [`docs/vmware-guide.md`](docs/vmware-guide.md)

<br/>

## 🔒 Catatan Keamanan (Penting!)

- Jalankan VM ini di mode **Host-only** atau **NAT**, hindari **Bridged** kalau nggak paham resiko jaringan.
- Aktifkan **Snapshot** di VirtualBox sebelum eksperimen macam-macam, biar gampang rollback.
- Jangan matikan antivirus/firewall di host hanya karena menjalankan VM.
- VM ini terisolasi dari host — instal/uninstall apapun di dalam VM **tidak akan merusak sistem utama (Windows/Mac/Linux) kamu**, selama kamu tidak mengaktifkan shared folder ke drive penting tanpa hati-hati.
- Untuk Kali Linux: gunakan hanya untuk pembelajaran & keperluan yang sah (ethical hacking, CTF, riset keamanan pribadi).

<br/>

## 📬 Kontak

<div align="center">
<a href="https://wa.me/6281330881417"><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a>
<a href="https://github.com/PutraWibu"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/></a>
<a href="https://www.youtube.com/@putramods21"><img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white"/></a>
</div>

<div align="center">
<sub>Made with ⚡ by <b>Putramods</b></sub>
</div>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1a1a1a,100:0f0f0f&height=90&section=footer" width="100%"/>
