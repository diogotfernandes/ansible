# ssh

Role para atualizar a configuração do SSH.

* Remove a autenticação por password
```yaml
PasswordAuthentication no
```
* Remove a autenticação com o utilizador > root
```yaml
PermitRootLogin no
```
* Muda a porta do ssh
```yaml
Port 2849
```
