#!/bin/bash
set -e

sudo yum install -y puppet-agent
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

