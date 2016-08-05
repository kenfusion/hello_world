#!/bin/bash
set -e

sudo yum install -y puppetserver
sudo service puppetserver start
sudo chkconfig puppetserver on

sudo ln -s /vagrant/puppet/manifests/site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp
sudo rm -rf /etc/puppetlabs/code/environments/production/modules/
sudo ln -s /vagrant/puppet/modules /etc/puppetlabs/code/environments/production/

# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-ntp
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-haproxy
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-mysql
# sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apache

