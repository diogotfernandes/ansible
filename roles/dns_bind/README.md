dns_bind
=========

Role para instalar e configurar o servidor de DNS bind9.

+ Instalação/Configuração do bind9
+ Criar forward/reverse zones



Role Variables
--------------
| Variable                       | Default                        | Description                                   |
|--------------------------------|--------------------------------|-----------------------------------------------|
| bind_packages                  | [bind9, bind9utils, bind9-doc] | Software a instalar                           |
| bind_default_forward_dns       | opendns                        | Nome do servidor a utilizar como forwarder    |
| bind_forwarders                | n/a                            | Lista com dns para servir como forwardares    |
| - bind_forwarders['key']       | opendns                        | Nome do dns                                   |
| - bind_forwarders['primary']   | 208.67.222.222                 | Endereço IP do servidor primário de dns       |
| - bind_forwarders['secondary'] | 208.67.220.220                 | Endereço IP do servidor secundário de dns     |
| bind_zones_path                | /var/lib/bind/zones            | Directório das zonas                          |
| bind_config_path               | /etc/bind                      | Directório de configuração do bind            |
| bind_log_path                  | /var/log/named                 | Directório do log do bind                     |
| bind_serial                    | 2021010100                     | Serial                                        |
| bind_refresh                   | 604800                         | Refresh                                       |
| bind_retry                     | 86400                          | Retry                                         |
| bind_expire                    | 2419200                        | Expire                                        |
| bind_negative_cache_ttl        | 604800                         | Negative Cache TTL                            |
| bind_ttl                       | 604800                         | TTL                                           |
| bind_acl_trusted_networks      | n/a                            | Lista com as redes ou IPs 'trusted'           |
| bind_zones                     | n/a                            | Lista com zonas a configurar                  |
| - bind_zones['name']           | foo.bar                        | Nome da zona                                  |
| - bind_zones['reverse']        | 100.168.192                    | Nome da zona reverse                          |
| - bind_zones['type']           | primary                        | Tipo de zona                                  |
| - bind_zones['serial']         | 2020010100                     | Serial da Zona                                |
| - bind_zones['admin_email']    | hostmaster                     | Email do responsável da zona                  |
| - bind_zones['mail_servers']   | [name: mail, preference: 10]   | Lista com os servidores de mx e a preferência |
| - bind_zones['nameservers']    | [192.168.100.5]                | Lista com os nameservers da zona              |
| - bind_zones['records']        | n/a                            | Lista com as entradas (A, CNAME, PTR) da zona |


Example Playbook
----------------

```yaml
- hosts: nameservers
  become: True

  roles:
   - dns_bind

  vars:
    bind_zones:
      - name: foo.bar
        reverse: 100.168.192
        type: primary
        serial: 2021010100
        admin_email: hostmaster #admin zone email
        mail_servers: #mx records
        - name: mail
          preference: 10
        nameservers:
          - ns1.foo.bar.
        records:
          - { name: ns1,    forward: 192.168.100.5,   type: A, rev: 5  }
          - { name: mail,   forward: 192.168.100.10,  type: A, rev: 10 }
          - { name: web01,  forward: 192.168.100.21,  type: A, rev: 21 }
          - { name: '@',    forward: 192.168.100.21,  type: A, rev: 21 }
          - { name: 'www',  forward: foo.bar,    type: CNAME }
    bind_acl_trusted_networks:
      - 192.168.100.0/24

```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
