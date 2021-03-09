Cloud Init KVM
=========

Role para a criação de uma nova máquina virtual (KVM) com base numa imagem `cloud-init`

+ Download da imagem (.qcow2) cloud-init
+ Criar um disco virtual (.qcow2) para a máquina virtual
+ Criar templates para o script cloud-init (user-data, meta-data, network)
+ Criar máquina virtual

Requirements
------------

+ `cloud-image-utils`

Role Variables
--------------

| Variable                       | Default                                                  | Description                                                                          |
|--------------------------------|----------------------------------------------------------|--------------------------------------------------------------------------------------|
| kvm_debian_base_img_url        | http://cloud.debian.org/images/cloud/buster/20210208-542 | URL da imagem (.qcow2) para fazer download                                           |
| kvm_debian_img_name            | debian-10-generic-amd64-20210208-542.qcow2               | Nome da imagem (.qcow2) a utilizar                                                   |
| kvm_debian_base_img_dst        | /mnt/hdd/kvm/debian-cloud-init-imgs                      | Directório para download da imagem e para a instalação da nova vm                    |
| kvm_new_vm_qcow2_name          | new_vm.qcow2                                             | Nome do disco (.qcow2) para a vm                                                     |
| kvm_new_vm_qcow_size           | 20                                                       | Tamanho virtual do disco a ser utilizado pela vm                                     |
| kvm_new_vm_user_data           | n/a                                                      | Lista com informação sobre o servidor                                                |
|   - hostname                   | foo                                                      | Hostname do servidor                                                                 |
|   - fqdn                       | foo.example.com                                          | FQDN do servidor                                                                     |
|   - manage_etc_hosts           | False                                                    | Bool para verificar se o script cloud-init vai fazer a gestão do ficheiro /etc/hosts |
|   - ssh_pwauth                 | True                                                     |                                                                                      |
|   - disable_root               | True                                                     |                                                                                      |
|   - chpasswd                   | []                                                       | Lista com o utilizador/password                                                      |
| - chpasswd['list']             | jonhdoe:password                                         | Password do utilizador                                                               |
| - chpasswd['expire']           | True                                                     | Obrigada o utilizador a modificar a password no primeiro login                       |
|   - users                      | []                                                       | Lista com informação do(s) utilizador(es) a criar no servidor                        |
|   - users['name']              | johndoe                                                  | Nome do utilizador                                                                   |
|   - users['sudo']              | ALL=(ALL) NOPASSWD:ALL                                   | Privilégios do utilizador                                                            |
| - users['groups']              | foogroup                                                 | Grupo(s) a adicionar ao utilizador                                                   |
| - users['home']                | /home/johndoe                                            | Directorio do utilizador                                                             |
| - users['shell']               | /bin/bash                                                | Shell do utilizador                                                                  |
| - users['ssh-authorized-keys'] | []                                                       | Lista com chaves ssh a adicionar ao servidor                                         |
| kvm_static_network             | []                                                       | Lista com informação do endereçamento estático                                       |
| - interface                    | enp1s0                                                   | Interface de rede                                                                    |
| - dhcp4                        | False                                                    | Desativa o dhcp                                                                      |
| - ipv4                         | 192.168.100.22                                           | Endereço IPv4                                                                        |
| - gw                           | 192.168.100.1                                            | Endereço do Gateway                                                                  |
| - ns1                          | 192.168.100.5                                            | Endereço do servidor de dns                                                          |
| - ns2                          | 1.1.1.1                                                  | Endereço do servidor de dns                                                          |
| - search                       | example.com                                              | Domínio do servidor                                                                  |



Example Playbook
----------------


```yaml
---
- hosts: localhost
  become: False
  gather_facts: False

  vars:
    kvm_new_vm_qcow2_name: "{{ kvm_new_vm_user_data.fqdn }}.qcow2"
    kvm_new_vm_qcow_size: 20
    kvm_new_vm_user_data:
      hostname: foo
      fqdn: foo.example.com
      manage_etc_hosts: False
      users:
        - name: johndoe
          sudo: ALL=(ALL) NOPASSWD:ALL
          groups: bar
          home: /home/johndoe
          shell: /bin/bash
          ssh-authorized-keys:
            - "{{lookup('file', '~/.ssh/id_rsa.pub')}}"
            - ssh - 32ec2ewqd23vr3r...
      ssh_pwauth: True
      disable_root: True
      chpasswd:
        list: johndoe:password
        expire: True

    kvm_new_vm_meta_data:
      instance-id: foo
      local-hostname: foo

    kvm_static_network:
      interface: enp1s0
      dhcp4: False
      ipv4: 192.168.100.200
      gw: 192.168.100.1
      ns1: 192.168.100.5
      ns2: 208.67.222.222
      search: example.com

  pre_tasks:
    - name: Ensure that cloud-image-utils is installed
      apt:
        name: cloud-image-utils
        state: present
      become: True

  roles:
    - cloud_init_kvm
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
