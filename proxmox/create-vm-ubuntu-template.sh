IMG_NAME=ubuntu-24.04-server-cloudimg-amd64.img
IMG_PATH=/var/lib/vz/template/iso/
wget https://cloud-images.ubuntu.com/releases/24.04/release/$IMG_NAME -P $IMG_PATH
qm create 10000 --memory 4096 --core 4 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
qm importdisk 10000 $IMG_PATH$IMG_NAME local-lvm
qm set 10000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1000-disk-0
qm set 10000 --ide2 local-lvm:cloudinit
qm set 10000 --boot c --bootdisk scsi0
qm set 10000 --serial0 socket --vga serial0