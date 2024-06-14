# Клонирование проекта на Proxmox

<pre>
    cd ~
    mkdir -p proxmox-homelab/ssh
    cd proxmox-homelab/ssh
    wget --backups=1 https://raw.githubusercontent.com/koye64x/proxmox-homelab/main/ssh/id_rsa.pub
    cd ~
    mkdir -p proxmox-homelab/proxmox
    cd proxmox-homelab/proxmox
    wget --backups=1 https://raw.githubusercontent.com/koye64x/proxmox-homelab/main/proxmox/create-vm-ubuntu-template.sh
    chmod +x create-vm-ubuntu-template.sh
    ./create-vm-ubuntu-template.sh
</pre>
