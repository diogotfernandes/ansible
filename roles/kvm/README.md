KVM
=========

Role para interagir com vms kvm.

+ Muda o estado da vm [ start, shutdown, pause, unpause ]
+ Adiciona/Remove uma lease DHCP estática de uma vm à virt_network (NAT)

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

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

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

---
```yaml
- hosts: localhost
  become: false
  gather_facts: no
  roles:
  - kvm
  vars:
    # Informação sobre o novo host a adicionar à network
    host:
      mode: add
      name: ns1.alcafaz.test
      ip: '192.168.100.5'
      mac: '52:54:00:bc:89:40'
      network: alcafaz.test
```

```shell
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

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
