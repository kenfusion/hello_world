#!/bin/bash
set -e

# populate fact_cache
ansible all -m setup
# run the site playbook
ansible-playbook /home/vagrant/ansible/site.yml
