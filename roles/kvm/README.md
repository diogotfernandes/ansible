kmv
=========

Role para criação de máquinas virtuais

+ Criação de máquinas virtuais (KVM)
+ Adiciona a nova máquina virtual ao inventário
+ Modificar o estado das máquinas virtuais (shutdown, pause, unpause, start)


Requirements
------------



Role Variables
--------------

| Variable                   | Default         | Description                                                           |
|----------------------------|-----------------|-----------------------------------------------------------------------|
| kvm_uri                    | qemu:///system  | uri de ligação ao libvirtd                                            |
| kvm_base_vm                | debian10        | Nome da máquina virtual base. É feito um clone desta máquina virtual. |
| kvm_network                | foo.net         | Nome da rede virtual a que as máquinas virtuais estão ligadas         |
| host                       | n/a             | Lista com informação sobre as máquinas virtuais a criar               |
| - host['name']             | host1           | Nome da máquina virtual                                               |
| - host['ip']               | 192.168.100.111 | Endereço IP da máquina virtual                                        |
| - host['add_to_inventory'] | True            | Bool para verificar se é para adicionar a nova ao `inventory`         |
| - host['inventory_group']  | group_name      | Nome do grupo no `inventory`                                          |
| kvm_name                   | host1           | Nome da máquina virtual. Utilizado para modificar o estado da mesma   |


Example Playbook
----------------

```yaml
---
  - hosts: kvm_host
    become: False
    gather_facts: False
    roles:
      - kvm

    vars:
      kvm_base_vm: debian10
      kvm_network: alcafaz.test
      host:
        - name: demo01.alcafaz.test
          ip: '192.168.100.51'
          inventory_group: webservers
          add_to_inventory: True
        - name: demo02.alcafaz.test
          ip: '192.168.100.52'
          inventory_group: nameservers
          add_to_inventory: True    
      kvm_name: "{{ host.name }}"
```

```yaml
# Criar máquina virtual, adcionar uma lease estática.
ansible-playbook 01.create-vm.yml --tags "create_vm" -i hosts

# Criar máquina virtual, adcionar uma lease estática e iniciar a mesma.
ansible-playbook 01.create-vm.yml --tags "create_vm, start" -i hosts

# Desligar a máquina virtual ( -- tags [shutdown, start, pause, unpause] )
ansible-playbook 01.create-vm.yml --tags shutdown -e host1 -i hosts
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
