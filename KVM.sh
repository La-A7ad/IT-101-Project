#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Step 1: Setting up the environment
echo "Installing necessary packages..."
pacman -Sy --noconfirm qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

# Enable and start libvirtd service
systemctl enable libvirtd
systemctl start libvirtd

# Step 2: Creating virtual disk
echo "Creating a virtual disk..."
qemu-img create -f qcow2 /var/lib/libvirt/images/archVM.qcow2 20G

# Step 3: Configuring network
echo "Configuring network..."
cat <<EOF > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: yes
EOF
netplan apply

# Step 4: Launch Virtual Machine
echo "Launching the Virtual Machine..."
virt-install --name archVM \
  --ram 2048 \
  --disk path=/var/lib/libvirt/images/archVM.qcow2,size=20 \
  --vcpus 2 \
  --os-type linux \
  --os-variant archlinux \
  --network network=default \
  --graphics none \
  --console pty,target_type=serial \
  --cdrom /home/Yusuf/Downloads/archlinux-2024.04.01-x86_64.iso

echo "Setting up Arch virtual machine..."
