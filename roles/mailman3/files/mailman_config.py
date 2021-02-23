#!/usr/bin/env python3

# https://docs.mailman3.org/projects/mailmanclient/en/latest/src/mailmanclient/docs/using.html
# Cria um novo dominio e tambem uma nova lista no mailman3

from mailmanclient import Client
client = Client('http://localhost:8001/3.1', 'restadmin', 'restapipassword')

new_domain = client.create_domain('alcafaz.test', alias_domain='x.alcafaz.test', description='alcafaz domain')

new_list = new_domain.create_list('list1')
