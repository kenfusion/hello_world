#!/bin/bash
set -e

sudo bash -c  "cat << EOF >> /etc/hosts
10.0.15.10  puppet puppet.example.com
10.0.15.21  node-01 node-01.example.com
10.0.15.22  node-02 node-02.example.com
10.0.15.23  node-03 node-03.example.com
10.0.15.24  node-04 node-04.example.com
10.0.15.25  node-05 node-05.example.com
10.0.15.26  node-06 node-06.example.com
EOF"

sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

case $(hostname -s) in
  puppet) /vagrant/puppetserver-install.sh ;;
  node-0*) /vagrant/puppet-agent-install.sh ;;
esac

