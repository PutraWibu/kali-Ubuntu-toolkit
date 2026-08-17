#!/bin/bash
# PutraMods VM Installer - Kali Linux (VirtualBox)
# Usage: ./create-kali-vm.sh /path/to/kali-linux-installer.iso

set -e

VM_NAME="PutraMods-Kali"
RAM_MB=4096
CPUS=2
DISK_MB=40000
ISO_PATH="$1"

if [ -z "$ISO_PATH" ]; then
  echo "❌ Usage: $0 /path/to/kali-linux-installer.iso"
  echo "   Download ISO resmi di: https://www.kali.org/get-kali/"
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
VBoxManage createvm --name "$VM_NAME" --ostype "Debian_64" --register

echo "⚙️  Konfigurasi resource VM..."
VBoxManage modifyvm "$VM_NAME" \
  --memory "$RAM_MB" \
  --cpus "$CPUS" \
  --vram 128 \
  --graphicscontroller vmsvga \
  --boot1 dvd --boot2 disk --boot3 none --boot4 none \
  --audio-driver none \
  --nic1 nat

echo "💾 Membuat virtual disk (${DISK_MB}MB)..."
VBoxManage createmedium disk \
  --filename "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi" \
  --size "$DISK_MB"

echo "🔌 Attach storage controller..."
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd \
  --medium "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi"

VBoxManage storagectl "$VM_NAME" --name "IDE" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE" --port 0 --device 0 --type dvddrive \
  --medium "$ISO_PATH"

echo "▶️  Menjalankan VM (lanjutkan instalasi lewat jendela GUI yang muncul)..."
VBoxManage startvm "$VM_NAME" --type gui

echo ""
echo "✅ VM '$VM_NAME' berhasil dibuat dan dijalankan."
echo "   Login default Kali (live/installer): username 'kali' / password 'kali'"
echo "   Ganti password ini setelah instalasi selesai."
