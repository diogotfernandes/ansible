Role Name
=========

Role para configuração inicial do servidor.

+ Actualizar/Instalar software
+ Definir timezone
+ Definir hostname
+ Gerar locales
+ Adicionar/Remover utilizadores
+ Modificar configuração `sshd_conf`
+ Criar firewall básica (ufw)


Role Variables
--------------


| Variable                                   | Default                            | Description                                                         |
|--------------------------------------------|------------------------------------|---------------------------------------------------------------------|
| bootstrap_timezone                         | Europe/Lisbon                      | Timezone a configurar no servidor                                   |
| bootstrap_packages                         | [python3-pip, sudo, aptitude, ufw] | Lista de software a instalar  no servidor                           |
| bootstrap_ssh                              | n/a                                | Lista com configurações a aplicar no `sshd_config`                  |
| - bootstrap_ssh['permit_root_login']       | 'no'                               | Desativar o login do utilizador `root`                              |
| - bootstrap_ssh['password_authentication'] | 'no'                               | Desativar login com password                                        |
| - bootstrap_ssh['port']                    | 22                                 | Porta utilizada para se ligar por ssh                               |
| bootstrap_locale                           | n/a                                | Lista com os `locales` a gerar                                      |
| - bootstrap_locale['name']                 | pt_PT.UTF-8                        | Nome do locale a gerar                                              |
| - bootstrap_locale['state']                | present                            |                                                                     |
| bootstrap_hostname                         | n/a                                | Lista com informação do hostname                                    |
| - bootstrap_hostname['name']               | foo                                | Nome do `hostname`                                                  |
| - bootstrap_hostname['domain']             | bar.com                            | Nome do `domain`                                                    |
| bootstrap_users                            | n/a                                | Lista com informação dos users                                      |
| - bootstrap_users['name']                  | janedoe                            | Nome do utilizador                                                  |
| - bootstrap_users['comment']               | Jane Doe                           | Comentário                                                          |
| - bootstrap_users['groups']                | sudo, foo                          | Conjunto de grupos a adicionar ao utilizador                        |
| - bootstrap_users['shell']                 | /bin/bash                          | `shell` do utilizador                                               |
| - bootstrap_users['create_home']           | True                               | Bool para verificar se é para criar uma `home` para o utilizador    |
| - bootstrap_users['home']                  | /home/janedoe                      | Localização da `home` do utilizador                                 |
| - bootstrap_users['password']              | secretpass                         | Password do utilizador                                              |
| - bootstrap_users['update_password']       | on_create                          | Quando se deve modificar a password.                                |
| - bootstrap_users['generate_ssh_key']      | 'yes'                              | Bool para verificar se é para criar uma chave ssh para o utilizador |
| - bootstrap_users['pub_key_path']          | ~/.ssh/id_rsa.pub                  | Localização da chave pública para fazer login por ssh               |
| bootstrap_remove_users                     | n/a                                | Lista de utilizadores a remover                                     |
| - bootstrap_remove_users['name']           | debian                             | Nome do utilizador a remover                                        |
| bootstrap_ufw                              | n/a                                | Lista com informação da firewall ufw                                |
| - bootstrap_ufw['direction']               | outgoing                           |                                                                     |
| - bootstrap_ufw['policy']                  | allow                              |                                                                     |
| bootstrap_ufw_rules                        | n/a                                | Lista de regras da firewall                                         |
| - bootstrap_ufw_rules['rule']              | 'allow'                            | Regra da firewall                                                   |
| - bootstrap_ufw_rules['port']              | 22                                 | Porta                                                               |
| - bootstrap_ufw_rules['proto']             | tcp                                | Protocolo                                                           |


Example Playbook
----------------


```yaml
- hosts: host1
  gather_facts: True
  become: True
  roles:
    - bootstrap

  vars:
    bootstrap_hostname:
      name: foo
      domain: alcafaz.test

    bootstrap_users:
      - name: jane
        comment: Jane Doe
        groups: sudo
        append: True
        shell: /bin/bash
        create_home: True
        home: /home/jane
        password: secretpass
        update_password: on_create
        generate_ssh_key: 'yes'
        pub_key_path: ~/.ssh/id_rsa.pub
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
