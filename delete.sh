#!/usr/bin/env bash

# Script to emulate the build of EC2 instances so that they can be added to the Ansible inventory.

ec2instances="$@"

if echo "$@" | grep DEBUG >/dev/null 2>&1
then
  DEBUG="-vvvv"
fi

for host in $ec2instances
do
  echo "ansible-playbook $DEBUG -i environment/hosts --extra-vars=\"customer=${host}\" --extra-vars=\"customer_domain=${host}.example.com\" add.yml"
  ansible-playbook $DEBUG -i environment/hosts --extra-vars="customer=${host}" --extra-vars="customer_domain=${host}.example.com" delete.yml
done
