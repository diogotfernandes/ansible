KVM
=========

Role para interagir com vms kvm.

+ Muda o estado da vm [ start, shutdown, pause, unpause ]
+ Adiciona/Remove uma lease DHCP estática de uma vm à virt_network (NAT)

Requirements
------------
Para mudar o estado de uma vm é obrigatório definir a variável `kvm_name` e quando executar o playbook passar a tag correspondente ao estado que é pretendido. `--tags [start, pause, unpause, shutdown]`.

Para adicionar/remover uma lease estática é necessário adicionar a variável `host`.
+ Adicionar: `mode: add`
+ Remover: `mode: remove`  

Role Variables
--------------
```yaml
kvm_name: host.name
kvm_uri: qemu:///system
host:
  mode: [ add, remove ]
  name: host.name
  ip: 10.0.0.100
  mac: '52:54:00:bc:89:40'
  network: libvirt_network_name
```

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

---

### Playbook
```yaml
- hosts: localhost
  become: false
  gather_facts: no
  roles:
  - kvm
  vars:
    # Informação sobre o novo host
    host:
      mode: add
      name: ns1.alcafaz.test
      ip: '192.168.100.5'
      mac: '52:54:00:bc:89:40'
      network: alcafaz.test
```
### ansible-playbook commands
```yaml
# Adiciona o host à network alcafaz.test
ansible-playbook kvm.yml --tags add_remove_ip
# Inicia a máquina virtual com o nome ns1.alcafaz.test
ansible-playbook kvm.yml -e "kvm_name=ns1.alcafaz.test" --tags start
# Pausa a máquina virtual com o nome ns1.alcafaz.test
ansible-playbook kvm.yml -e "kvm_name=ns1.alcafaz.test" --tags pause
```

License
-------

BSD

Author Information
------------------
Diogo Fernandes
