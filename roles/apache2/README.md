apache2
=========

Role para instalação do servidor HTTP apache2.

+ Instala o apache2
+ Cria virtual host(s)
+ Remove o default virtual host
+ Cria uma página `index.html` de exemplo
+ Cria uma regra na firewall (ufw)


Role Variables
--------------

+ defaults

| Variable                     | Default                      | Description                                                            |
|------------------------------|------------------------------|------------------------------------------------------------------------|
| apache2_packages             | [apache2]                    | Lista com o software a instalar                                        |
| apache2_create_vhost         | False                        | Bool para verificar se é para criar virtual hosts                      |
| apache2_remove_default_vhost | True                         | Bool para verificar se é para remover o virtual host por omissão       |
| apache2_path                 | /etc/apache2                 | Directório do apache2                                                  |
| apache2_site_available_path  | /etc/apache2/sites-available | Directório dos ficheiros de configuração dos virtual hosts             |
| apache2_default_vhost_name   | 000-default.conf             | Nome do ficheiro de configuração do virtual host default               |
| apache2_default_port         | '80'                         | Porto utilizado para criar uma excepção na firewall (ufw)              |
| apache2_document_root        | /var/www                     | Directório do conteúdo dos virtual hosts                               |
| apache2_vhost                | n/a                          | Lista com a definição dos virtual hosts a configurar                   |
|   - name                     | example.com                  | Nome do virtual host                                                   |
|   - server_name              | www.example.com              | Alias do virtual host                                                  |
|   - conf_name                | example.com.conf             | Nome do ficheiro de configuração do virtual host                       |
|   - create_index             | True                         | Bool para verificar se é para criar uma página (index.html) de exemplo |
|                              |                              |                                                                        |


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: webservers
  become: True
  gather_facts: True
  roles:
    - apache2

  vars:
    apache2_create_vhost: True
    apache2_vhost:
      - name: alcafaz.test
        server_name: www.alcafaz.test
        conf_name: alcafaz.test.conf
        port: 80
        index_page: True
```


Author Information
------------------

Diogo Fernandes | a21230576@isec.pt
