#!/bin/bash
# PutraMods VM Installer - Ubuntu (VirtualBox, unattended install)
# Usage: ./create-ubuntu-vm.sh /path/to/ubuntu-desktop.iso

set -e

VM_NAME="PutraMods-Ubuntu"
RAM_MB=4096
CPUS=2
DISK_MB=40000
ISO_PATH="$1"

# Ganti kredensial default di sini kalau perlu
USERNAME="putramods"
PASSWORD="PutraMods2026!"
FULL_NAME="PutraMods"
HOSTNAME="putramods-ubuntu.local"

if [ -z "$ISO_PATH" ]; then
  echo "❌ Usage: $0 /path/to/ubuntu-desktop.iso"
  echo "   Download ISO resmi di: https://ubuntu.com/download/desktop"
  exit 1
fi

if [ ! -f "$ISO_PATH" ]; then
  echo "❌ File ISO tidak ditemukan: $ISO_PATH"
  exit 1
fi

if ! command -v VBoxManage &> /dev/null; then
  echo "❌ VBoxManage tidak ditemukan. Install VirtualBox dulu: https://www.virtualbox.org/wiki/Downloads"
  exit 1
fi

echo "🚀 Membuat VM '$VM_NAME'..."
VBoxManage createvm --name "$VM_NAME" --ostype "Ubuntu_64" --register

echo "⚙️  Konfigurasi resource VM..."
VBoxManage modifyvm "$VM_NAME" \
  --memory "$RAM_MB" \
  --cpus "$CPUS" \
  --vram 128 \
  --graphicscontroller vmsvga \
  --nic1 nat

echo "💾 Membuat virtual disk (${DISK_MB}MB)..."
VBoxManage createmedium disk \
  --filename "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi" \
  --size "$DISK_MB"

echo "🔌 Attach storage controller..."
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd \
  --medium "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi"

echo "🤖 Menjalankan unattended install (otomatis, tanpa perlu klik manual)..."
VBoxManage unattended install "$VM_NAME" \
  --iso="$ISO_PATH" \
  --user="$USERNAME" \
  --password="$PASSWORD" \
  --full-user-name="$FULL_NAME" \
  --hostname="$HOSTNAME" \
  --install-additions \
  --start-vm=gui

echo ""
echo "✅ VM '$VM_NAME' sedang diinstall otomatis. Tunggu sampai proses selesai (bisa 10-20 menit)."
echo "   Login setelah selesai: username '$USERNAME' / password '$PASSWORD'"
echo "   Disarankan ganti password setelah login pertama."
