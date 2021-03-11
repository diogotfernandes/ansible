fail2ban
=========

Role para instalar/configurar o fail2ban.

+ Instalação do fail2ban
+ Configuração de `jails`

Requirements
------------

+ MTA para envio de notificações sobre o fail2ban

Role Variables
--------------
| Variable                   | Default               | Description                                                                     |
|----------------------------|-----------------------|---------------------------------------------------------------------------------|
| f2ban_findtime             | 10m                   | Espaço de tempo em que o fail2ban monitoriza tentativas consecutivas, falhadas. |
| f2ban_maxretry             | 3                     | Número de tentativas falhadas, consecutivas, num espaço de tempo                |
| f2ban_default_action       | action_mw             | Ação do fail2ban.                                                               |
| f2ban_loglevel             | INFO                  |                                                                                 |
| f2ban_logtarget            | /var/log/fail2ban.log | Ficheiro de log do fail2ban                                                     |
| f2ban_mail                 | n/a                   | Lista com informações sobre o email, para envio de alertas                      |
| - f2ban_mail['mta']        | sendmail              | MTA                                                                             |
| - f2ban_mail['destemail']  | admin@foo.bar         | Email de destino                                                                |
| - f2ban_mail['sender']     | f2ban                 | Email do remetente. (f2ban@foo.bar)                                             |
| - f2ban_mail['sendername'] | Fail2Ban Alerts       | Nome do remetente                                                               |
| f2ban_jails                | n/a                   | Lista com as `jail's` a configurar no fail2ban                                  |
| - f2ban_jails['name']      | sshd                  | Nome da `jail`                                                                  |
| - f2ban_jails['enabled']   | true                  | Estado da `jail`                                                                |
| - f2ban_jails['port']      | 22                    | Porta da `jail`                                                                 |
| - f2ban_jails['logpath']   | sshd_log              | Log para o fail2ban monitorizar                                                 |
| - f2ban_jails['backend']   | sshd_backend          |                                                                                 


Example Playbook
----------------


```yaml
---
- hosts: all
  gather_facts: False
  become: True
  roles:
    - fail2ban

  pre_tasks:
    - name: Install sendmail to send notifications about f2ban
      apt:
        name: sendmail
        state: present

  vars:
    f2ban_findtime: 10m
    f2ban_maxretry: 3
    f2ban_default_action: action_mw # ban and send email
    f2ban_loglevel: INFO
    f2ban_logtarget: /var/log/fail2ban.log

    f2ban_mail:
      mta: sendmail
      destemail: admin@alcafaz.test
      sender: f2ban
      sendername: Fail2Ban Alerts

    f2ban_jails:
      - name: sshd
        enabled: true
        port: 22
        logpath: sshd_log
        backend: sshd_backend
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
