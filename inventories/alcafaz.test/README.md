# Playbooks

## 00.tests.yml

Testes....

## 01.bootstrap.yml

**Configuração incial do servidor.**

+  `ansible-playbook 00.bootstrap.yml -e "ansible_user=root ansible_password=qwerty" -i hosts`

Configura tudo. [packages, timezone, hostname, locales, ssh, users, ufw]

+ `ansible-playbook 00.bootstrap.yml -e "ansible_user=root ansible_password=qwerty" -i hosts --tags [tag]`

 Configura apenas a opção correspondente à tag ( --tags[packages, timezone, hostname, locales, ssh, users, ufw] )

+ `ansible-playbook 00.bootstrap.yml -e "ansible_user=root ansible_password=qwerty" -i hosts --tags ssh`

## 02.create-vm.yml

**Faz um ou vários clone(s) de uma máquina virtual base.**

+ `ansible-playbook 01.create-vm.yml --tags "create_vm" -i hosts`

Clone da máquina virtual base (debian10) e adiciona uma lease estática à `virtual network`

+ `ansible-playbook 01.create-vm.yml --tags "create_vm, start" -i hosts`

Clone da máquina virtual base (debian10), adiciona uma lease estática à `virtual network` e "arranca" com a máquina virtual.


## 03.create-vm-and-bootstrap.yml

**Faz um ou vários clone(s) de uma máquina virtual base, e executa o role `bootstrap`.**

+  `ansible-playbook 02.create-vm-and-bootstrap.yml --tags "create_vm, start, packages, timezone, hostname, locales, ssh, users, ufw" -i inventories/alcafaz.test/hosts`


## 04.change_vm_state.yml

**Altera o estado da máquina virtual. (start, pause, unpause, shutdown)**

+ `ansible-playbook 02.change_vm_state.yml --tags start -e "kvm_name=vm_name"`

Inicia a vm `vm_name`

+ `ansible-playbook 02.change_vm_state.yml --tags pause -e "kvm_name=vm_name"`

Pausa a vm `vm_name`

+ `ansible-playbook 02.change_vm_state.yml --tags shutdown -e "kvm_name=vm_name"`

Desliga a vm `vm_name`

## 05.cloud-init-kvm.yml

**Cria uma máquina virtual, com base numa imagem debian cloud-init**

+ `ansible-playbook 05.cloud-init-kvm.yml --ask-become-pass`
