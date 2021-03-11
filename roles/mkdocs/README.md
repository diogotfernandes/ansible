mkdocs
=========

Role para criar documentação (mkdocs) e enviar para um servidor remoto

+ Build da documentação mkdocs
+ Enviar para um servidor remoto



Role Variables
--------------

| Variable                         | Default                              | Description                                 |
|----------------------------------|--------------------------------------|---------------------------------------------|
| mkdocs_local_path                | /home/diogo/Documents/docs           | Directorio local dos docs                   |
| mkdocs_build_config              | "{{ mkdocs_local_path }}/mkdocs.yml" | Ficheiro de configuração do mkdocs          |
| mkdocs_build_output_dir          | /tmp/site                            | Directório de "saída" do comando build      |
| mkdocs_remote_path               | /var/www/ansible.diogof.pt           | Directório remoto, para enviar os ficheiros |
| mkdocs_remote_host               | n/a                                  | Lista com informação do host remoto         |
| - mkdocs_remote_host['name']     | foo                                  | Nome do utilizador remoto                   |
| - mkdocs_remote_host['domain']   | bar.com                              | Nome do domínio                             |
| - mkdocs_remote_host['ssh_port'] | 22                                   | Porta ssh do servidor remoto                |


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
