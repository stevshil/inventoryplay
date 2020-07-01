# Playing with dynamic registry

This example shows you how to add and remove newly created systems to your inventory.  It also has the delete method too.

## Environment

The folder layout is that the **environment** directory contains only the Ansible inventory file called **hosts**.

This file only contains 2 sections;
* all
  - which enables the playbook to run on the localhost, just like you would to spin up ec2 instances in AWS
* wordpress
  - The **hostgroup** we wish to add the new hosts to or remove from

## Roles

This folder contains the **addtoinventory** role which will add the hosts to the inventory with the relevant attributes, including the user variables passed on the command line with the ```--extra-args```.

It also contains a **removefrominventory** file that will remove a specific host from the file based on the customer name provided.

## tmpvars

This directory contains some example data to emulate an EC2 instance being built, but only contains the required attributes of;
* public_dns_name
* private_ip_address
* instance_id

## The playbooks

2 playbooks exist in this project to call the 2 different roles;
* add.yml
  - This will perform the adding of the data to the host inventory file, to emulate the building of a new ec2 instance
* delete.yml
  - This will remove a host from the inventory

To run the playbooks;

* Adding the hosts to the inventory requires you to simply run the commans;
  - ```./add.sh```
* To remove a host from the inventory run;
  - ```./delete.sh cherry```
* To remove multiple hosts;
  - ```./delete.sh steve cherry```

To understand how the playbooks are called you need to look at the **ansible-playbook** command in both the shell scripts and notice the use of the ```--extra-vars="customer_domain=${host}.example.com"```.  This would be the argument to supply that would define your customers DNS name as extra data in the file and tag your instance being created.
