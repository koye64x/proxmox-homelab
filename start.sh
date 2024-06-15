cd ~
mkdir -p proxmox-homelab/ssh
cd proxmox-homelab/ssh
wget --backups=1 https://raw.githubusercontent.com/koye64x/proxmox-homelab/main/ssh/id_rsa.pub
# create template
cd ~
mkdir -p proxmox-homelab/proxmox
cd proxmox-homelab/proxmox
wget --backups=1 https://raw.githubusercontent.com/koye64x/proxmox-homelab/main/proxmox/create-vm-ubuntu-template.sh
chmod +x create-vm-ubuntu-template.sh
./create-vm-ubuntu-template.sh
# clone kubernetes nodes
cd ~
mkdir -p proxmox-homelab/kuber
cd proxmox-homelab/kuber
wget --backups=1 https://raw.githubusercontent.com/koye64x/proxmox-homelab/main/kuber/01_create_nodes.sh
chmod +x 01_create_nodes.sh
./01_create_nodes.sh
