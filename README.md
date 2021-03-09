# Ansible

## Ansible Roles e Playbooks utilizados no decorrer do estágio


## Estrutura de pastas

### Ansible

+ Pasta `ansible`:


```console
foo@bar:~$ tree ansible

├── 00.test.yml
├── 01.create-vm-and-initial-config.yml
├── 02.cloud-init-kvm.yml
├── 03.dns.yml
├── 04.infra_simpleMail_simpleWeb_dns.yml
├── 05...
├── ansible.cfg
├── filter_plugins
├── inventories
├── README.md
└── roles

```

### Inventories


```console
foo@bar:~$ tree ansible/inventories/alcafaz.test

├── group_vars
│   ├── all.yml
│   ├── mailservers.yml
│   ├── nameservers.yml
│   └── webservers.yml
├── hosts
└── host_vars
    ├── mail
    │   ├── cyrus-imap.yml
    │   ├── cyrus-sasl.yml
    │   ├── initial-setup.yml
    │   ├── mailman3.yml
    │   └── postfix.yml
    ├── ns1
    │   ├── bind9.yml
    │   ├── initial-setup.yml
    │   └── ns1.yml
    └── web01
        ├── apache2.yml
        └── initial-setup.yml
```

### Roles

+ Pasta `roles` com todos os roles:

```console
foo@bar:~$ tree ansible/roles

├── apache2
├── cloud_init_kvm
├── dns_bind
├── initial_setup
├── wordpress
├── loadbalancer
├── mailman3
├── postfix
└── ...
```

+ Dentro de cada `role`:

```console
foo@bar:~$ tree ansible/roles/apache2

├── defaults
├── handlers
├── README.md
├── tasks
└── templates
```
