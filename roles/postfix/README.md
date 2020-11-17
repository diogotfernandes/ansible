Postfix
=========

Role para instalação do Postfix

Ficheiros de Configuração
------------

+ `/etc/postfix/main.cf`
+ `/etc/postfix/master.cf`


Role Variables
--------------

```yaml
postfix_mailname: example.com                   
postfix_main_mailer_type: Internet Site                 
postfix_mynetworks: 127.0.0.1                     
postfix_recipient_delim: +                             
postfix_root_address: foo@example.com               
postfix_mydomain: example.com                   
postfix_myhostname: mail.example.com              
postfix_packages:
   - postfix
   - postfix-doc  
```



Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: mail
      roles:
         - { role: postfix }


Author Information
------------------
Diogo Fernandes
