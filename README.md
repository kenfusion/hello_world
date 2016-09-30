# Hello world!

This is a show case to demonstrate different methods of provisioning a simple LAMP stack with HA using the following tools:

- [x] Ansible
- [x] Puppet
- [ ] Chef
- [ ] Salt
- [ ] CFEngine

Each tool is kept in it's sepearate vagrant envrionment.  After the stack is provisioned, you should be able to visit http://localhost:8001 to see the app being served from both node-03 and node-04.  You can also visit http://localhost:8001/haproxy?stats as well.

![](mystack.png)
