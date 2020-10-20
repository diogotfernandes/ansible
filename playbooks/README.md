# apacheWebserver
* usage
``` ansible-playbook playbooks/apacheWebserver.yml -i [hostFile] ...???? ```
```yaml
- hosts: all
  become: yes
  roles:
  - webserver
```

# dns
* usage
```ansible-playbook playbooks/dns.yml -i [hostFile] -u [user] -K --extra-vars forward_dns=opendns ```
```yaml
- hosts: nameserver
  become: true
 
  vars_files:
    - ../vars/dns.yml

  roles:
   - dns-bind
```

# initial-setup
* usage
``` ansible-playbook playbooks/initial-setup -u root --ask-pass -K  ```

```yaml
- hosts: all
  become: true
 
  vars_files:
    - ../vars/initial-setup.yml

  roles:
   - essentials
   - user
   - hostname
   - timezone
   - ssh
   - ufw
```