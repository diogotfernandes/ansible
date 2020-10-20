#dns-bind

Role para instalação do Bind9. 

* basic usage
```yaml
ansible-playbook playbooks/dns-bind.yml -i hosts -K -u [user] --extra-vars forward_dns=[google, opendns, cloudfare]
```
--ask-become-pass (-K for short) -> para especificar a password do SUDO
-i -> para especificar o inventário
--extra-vars -> especificar variáveis diferentes ou especificar variáveis que não foram declaradas
forward_dns -> especificar quais os forwarders. Por omissão está definido o 'opendns'