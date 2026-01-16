#!/bin/bash 

#This is a simple Script written to install docker on linux mint/Ubuntu

set -e 
echo  -e "=========Installing Docker========="

echo "Enabling KVM "
modprobe kvm
echo "Configurationing Kvm according to our system"
modprobe kvm_intel  # Intel processors

modprobe kvm_amd    # AMD processors

echo "Checking if Kvm modules is enable and running "
lsmod | grep kvm
kvm_amd               167936  0
ccp                   126976  1 kvm_amd
kvm                  1089536  1 kvm_amd
irqbypass              16384  1 kvm

echo "Seeting up Kvm device permission"
ls -al /dev/kvm

echo  "Adding User to Kvm "
sudo usermod -aG kvm $USER

#Now let install according to  our linux mint/ Ubuntu distro

echo "Installing via apt packages"
sudo apt-get update
sudo apt install ./docker-desktop-amd64.deb

echo "Check if docker is running"
systemctl --user start docker-desktop

