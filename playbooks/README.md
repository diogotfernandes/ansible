# apacheWebserver
* Setup
``` ansible-playbook playbooks/apacheWebserver.yml -i [hostFile] ...???? ```
```yaml
- hosts: all
  become: yes
  roles:
  - webserver
```

# dns
* Setup
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
* Setup
``` ansible-playbook playbooks/initial-setup -i [newHost] -u root --ask-pass -K --extra-vars user=newUser  ```

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