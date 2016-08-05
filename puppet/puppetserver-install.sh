#!/bin/bash
set -e

sudo yum install -y puppetserver
sudo service puppetserver start
sudo chkconfig puppetserver on

