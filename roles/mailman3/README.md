mailman3
=========

Instalação e Configuração do mailman3-full (Mailman3-web e Mailman3-core)

+ Instalação do mailman-full através do debconf
+ Configuração do mailman3
+ Criação de uma lista de um domínio e lista de teste

+ [Unusual Postfix configuration](Unusual Postfix configuration)

Requirements
------------

+ Servidor Web - apache2
+ MTA - postfix
+ DB - postgresql


Role Variables
--------------

| Variable                        | Default       | Description                                                                                              |
|---------------------------------|---------------|----------------------------------------------------------------------------------------------------------|
| mailman3_config_path            | /etc/mailman3 | Directório de configuração do mailman3                                                                   |
| dbconfig_common                 | n/a           | Lista com configurações do dbconfig_common                                                               |
| mailman3_create_domain_and_list | True          | Bool para verificar se é para criar uma lista e domínio de teste                                         |
| mailman_cfg                     | n/a           | Lista com configurações do ficheiro de configuração do mailman `/etc/mailman3/mailman.cfg`               |
| mailman_web                     | n/a           | Lista com configurações do ficheiro de configuração do mailman3web `/etc/mailman3/mailman-web.py`        |
| mailman_hyperkitty              | n/a           | Lista com configurações do ficheiro de configuração do hyperkitty `/etc/mailman3/mailman-hyperkitty.cfg` |
| mailman3_debconf                | n/a           | Lista com configurações do mailman3_debconf                                                              |
| mailman3_web_debconf            | n/a           | Lista com configurações do mailman3_web_debconf                                                          |

Example Playbook
----------------

```yaml
---
- hosts: mailservers
  become: True

  pre_tasks:
    - name: Ensure that debconf is installed
      apt:
        name: debconf
        state: present

  vars:
    # Cria dominio e lista de teste
    # só utilizar na 1a instalação, senão dá erro...
    mailman3_create_domain_and_list: True
    # se utilizar o python3 dá erro quando instalo o postgresql...
    ansible_python_interpreter: /usr/bin/python

  roles:
   - apache2
   - postgresql
   - mailman3
```
```yaml
ansible-playbook 09.mailman3.yml -i hosts
```



Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
