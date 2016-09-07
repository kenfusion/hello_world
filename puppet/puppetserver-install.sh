#!/bin/bash
set -e

sudo yum install -y puppetserver

# change java memory allocation from 2g to 512m
# https://docs.puppet.com/puppetserver/latest/install_from_packages.html#memory-allocation
sudo sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver

# enable cert autosign
sudo sh -c 'echo "*.example.com" >> /etc/puppetlabs/puppet/autosign.conf'

sudo rm -rf /etc/puppetlabs/code/environments/production/
sudo ln -s /vagrant/puppet/production /etc/puppetlabs/code/environments/

sudo /opt/puppetlabs/bin/puppet module install puppetlabs-mysql --modulepath=/etc/puppetlabs/code/modules
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-ntp
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-haproxy
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apache

sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true
