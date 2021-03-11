# Ansible

## Ansible Roles e Playbooks utilizados no decorrer do estágio


## Estrutura de pastas

### Ansible

```console
foo@bar:~$ tree ansible

.
├── ansible.cfg
├── filter_plugins
├── inventories
├── README.md
└── roles

```

### Inventories


```console
foo@bar:~$ tree ansible/inventories/alcafaz.test

├── 00.tests.yml
├── 01.bootstrap.yml
├── 02.create-vm.yml
├── ...
├── group_vars
├── hosts
└── host_vars
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
