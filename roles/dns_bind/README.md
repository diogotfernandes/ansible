# dns-bind

Role para instalação do Bind9. Utiliza templates em jinja2.

## usage
```yaml
ansible-playbook playbooks/dns-bind.yml
```

## vars

+ bind_zones []
lista com zonas
+ name:
nome da zona
+ type:
tipo da zona ['primary', 'secondary', 'forwarder']
+ serial:
serial da zona
+ admin_email:
email do hostmaster
+ primary:
ip do servidor DNS ???
+ nameservers:
lista com nameservers da zona
+ records:
entradas dns da zona (do tipo 'A', 'CNAME', ...)

``` yaml
bind_zones:
  - name: example.com
    reverse: 0.0.10
    type: primary
    serial: 2020011901
    admin_email: hostmaster
    primary: 192.168.100.5
    nameservers:
      - ns1.dd.test.
      - ns2.dd.test.
    records:
      - { name: lb01,   forward: 10.0.0.11,     type: A, rev: 11 }
      - { name: lb02,   forward: 10.0.0.12,     type: A, rev: 12 }
      - { name: web01,  forward: 10.0.0.21,     type: A, rev: 21 }
      - { name: web02,  forward: 10.0.0.22,     type: A, rev: 22 }
      - { name: www,    forward: 10.0.0.100,    type: A, rev: 100 }
      - { name: ns1,    forward: 192.168.100.5,   type: A  }
      - { name: ns2,    forward: 192.168.100.6,   type: A }
```
