# Purpose

This is an example of a LAMP stack with HA provisioned with Ansible.

# How to start

```bash
vagrant up
vagrant ssh mgmt
ansible all -m setup # this will populate fact_caching
cd ansible/example-roles/
ansible-playbook site.yml --ask-vault # vault pass is vagrant
```

Point your browser to localhost:8001
