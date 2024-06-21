arr_vm_id=(1000 1001 1002 1003 1101 1102 1103)
arr_vm_ip=("192.168.1.100 192.168.1.101" "192.168.1.102" "192.168.1.103" "192.168.1.111" "192.168.1.112" "192.168.1.113")
arr_vm_host=("installer" "master1" "master2" "master3" "node1" "node2" "node3")
for key in "${!arr_vm_id[@]}"
do
  qm clone 10000 "${arr_vm_id[$key]}" --name "${arr_vm_host[$key]}" --full
  qm set "${arr_vm_id[$key]}" --ipconfig0 gw=192.168.1.1, ip="${arr_vm_ip[$key]}"/24
  if [ "${arr_vm_id[$key]}" != 1000 ]; then
    cd ~
    cd proxmox-homelab/ssh
    qm set "${arr_vm_id[$key]}" --sshkeys id_rsa.pub
  fi
  qm resize "${arr_vm_id[$key]}" scsi0 30G
done