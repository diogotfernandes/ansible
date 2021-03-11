wordpress
=========

Role para instalação do wordpress

+ Download do wordpress
+ Instalação do wordpress
+ Configuração do wordpress



Role Variables
--------------

| Variable        | Default                                       | Description                                           |
|-----------------|-----------------------------------------------|-------------------------------------------------------|
| wp_version      | latest                                        | Versão do wordpress a instalar                        |
| wp_db_name      | wordpress                                     | Nome da base de dados a ser utilizado pelo wordpress  |
| wp_db_user      | wp                                            | Nome do utilizador da base de dados do wordpress      |
| wp_db_password  | secret                                        | Password do utilizador da base de dados do wordpress  |
| wp_table_prefix | wp_                                           | Prefixo a ser utilizado na base de dados do wordpress |
| wp_home         | http://foo.bar                                |                                                       |
| wp_siteurl      | http://foo.bar                                |                                                       |
| wp_install_path | /var/www/foo.bar                              | Directório de instalação do wordpress                 |
| wp_download_url | https://wordpress.org/{{ wp_version }}.tar.gz | Link para download do wordpress                       |

Dependencies
------------

## Roles

+ geerlingguy.php
+ apache2
+ mariadb

Example Playbook
----------------

```yaml
- hosts: webservers
  become: True

  roles:
   - apache2
   - geerlingguy.php
   - mariadb
   - wordpress

  tasks:
    # https://make.wordpress.org/hosting/handbook/handbook/server-environment/#system-packages
    - name: Install some packages required for wordpress
      apt:
        name: [ ghostscript, imagemagick ]

    - name: Change apache2 dir.conf to serve php
      lineinfile:
        path: /etc/apache2/mods-available/dir.conf
        regexp: 'DirectoryIndex'
        line: '        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm'

```

Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
