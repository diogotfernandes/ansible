postgresql
=========

Role para instalação do postgresql


Role Variables
--------------



Example Playbook
----------------
```yaml
- hosts: mailservers
  become: True

  vars:
    # se utilizar o python3 dá erro quando instalo o postgresql...
    ansible_python_interpreter: /usr/bin/python

  roles:
   - postgresql

```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
