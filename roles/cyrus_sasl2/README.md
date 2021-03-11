cyrus_sasl2
=========

Role para instalar e configurar o SASL2 (autenticação).

+ Instalação e configuração do SASL2
+ Criação de utilizadores para autenticação no cyrus-imap



Role Variables
--------------

| Variable                              | Default                                   | Description                                                                               |
|---------------------------------------|-------------------------------------------|-------------------------------------------------------------------------------------------|
| sasl2_packages                        | [libsasl2-modules, sasl2-bin, libsasl2-2] | Lista de software a instalar                                                              |
| default_sasl_group                    | sasl                                      | Grupo, por omissão, do sasl                                                               |
| sasl2_create_users                    | False                                     | Bool para verificar se é para criar utilizadores                                          |
| sasl_users                            | n/a                                       | Lista de utilizadores para criar                                                          |
| - sasl_users['name']                  | johndoe                                   | Nome do utilizador                                                                        |
| - sasl_users['password']              | secretpass                                | Password do utilizador                                                                    |
| - sasl_users['domain']                | foobar.com                                | Domínio                                                                                   |
| sasl_default_imap_admin               | n/a                                       | Lista com o par user/password do administrador do sasl                                    |
| - sasl_default_imap_admin['name']     | cyrus                                     | Nome do administrador. conincidir com o campo `admins: username` no ficheiro `imapd.conf` |
| - sasl_default_imap_admin['password'] | secret                                    | Password do administrador                                                                 |



Example Playbook
----------------

```yaml
- hosts: mailservers
  become: True

  roles:
   - cyrus_imap

  vars:
    sasl2_create_users: True
    sasl_users:
      - name: johndoe
        password: secret
        domain: foo.bar
      - name: jane
        password: notsecret
        domain: foo.bar
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
