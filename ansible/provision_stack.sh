#!/bin/bash
set -e

# populate fact_cache
ansible all -m setup

# run the site playbook
ansible-playbook /home/vagrant/ansible/example-roles/site.yml --vault-password-file /home/vagrant/ansible/super_sekrit_file
