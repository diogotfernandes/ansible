mariadb
=========

Role para instalação/configuração do servidor de base de dados mariadb

+ Instalação/Configuração do servidor mariadb
+ Criação de utilizadores
+ Criação de base de dados


Role Variables
--------------

| Variable                      | Default                     | Description                                          |
|-------------------------------|-----------------------------|------------------------------------------------------|
| mariadb_packages              | [mariadb-server]            | Lista com o software a instalar                      |
| mariab_mysqld                 | n/a                         | Lista com configurações do servidor de base de dados |
| mariab_mysqld['port']         | 3306                        | Porta a utilizar pelo servidor mariadb               |
| mariab_mysqld['bind_address'] | 127.0.0.1                   | Endereço IP a utilizar pelo servidor mariadb         |
| mariadb_config_path           | /etc/mysql                  | Directório do servidor mariadb                       |
| mariadb_unix_socket           | /var/run/mysqld/mysqld.sock | Socket para se ligar ao servidor mariadb             |
| mariadb_user                  | root                        | Utilizador com privilégios totais                    |
| mariadb_databases             | n/a                         | Lista com base de dados a criar                      |
| mariadb_databases['name']     | wordpress                   | Nome da base de dados                                |
| mariadb_databases['state']    | present                     |                                                      |
| mariadb_users                 | n/a                         | Lista de utilizadores a criar                        |
| mariadb_users['name']         | wp                          | Nome do utilizador                                   |
| mariadb_users['password']     | secret                      | Password do utilizador                               |
| mariadb_users['host']         | localhost                   |                                                      |
| mariadb_users['priv']         | "wordpress.*:ALL,GRANT"     | Privilégios do utilizador                            |


Example Playbook
----------------

```yaml
---
  - hosts: webservers
    become: True

    roles:
     - mariadb

     vars:
       mariadb_databases:
         - name: wordpress
           state: present
       mariadb_users:
         - name: wp
           password: qwerty
           host: localhost
           priv: "wordpress.*:ALL,GRANT"

```



Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
