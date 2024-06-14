IMG_NAME=ubuntu-24.04-server-cloudimg-amd64.img
IMG_PATH=/var/lib/vz/template/iso/
if ! test -f $IMG_PATH$IMG_NAME; then
  wget https://cloud-images.ubuntu.com/releases/24.04/release/$IMG_NAME -P $IMG_PATH
fi
VM_ID=10000
qm create $VM_ID --memory 4096 --core 4 --name ubuntu-cloud --net0 virtio,bridge=vmbr0 --template
qm importdisk $VM_ID $IMG_PATH$IMG_NAME local-lvm
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-1000-disk-0
qm set $VM_ID --ide2 local-lvm:cloudinit
qm set $VM_ID --boot c --bootdisk scsi0
qm set $VM_ID --serial0 socket --vga serial0