#!/usr/bin/env bash

#####################################################################################
# This file is modified slightly from the reference here:
# http://akrabat.com/computing/provisioning-with-ansible-within-the-vagrant-guest/
#####################################################################################

export PYTHONUNBUFFERED=1

if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Add APT repositories"
    export DEBIAN_FRONTEND=noninteractive
    apt-get install -qq software-properties-common &> /dev/null || exit 1
    apt-add-repository ppa:ansible/ansible &> /dev/null || exit 1

    apt-get update -qq

    echo "Installing Ansible"
    apt-get install -qq ansible &> /dev/null || exit 1
    echo "Ansible installed"
fi

# Replace hosts file
rm -f /etc/ansible/hosts
printf 'localhost ansible_ssh_host=127.0.0.1 ansible_ssh_user=vagrant ansible_ssh_pass=vagrant ansible_sudo_pass=vagrant' >> /etc/ansible/hosts

# Execute Ansible provisioner
cd /vagrant/provisioning

# NOTE: if you run --connection=local flag, git clone fails in current ansible version,
# so thats why we add all the bullshit info above to the hosts file. Since this is
# for a dev machine, don't worry about the security; but DO.NOT. setup a hosts file
# as above for production environments. Ever.
#ansible-playbook setup.yml --connection=local -vvvv
#ansible-playbook setup.yml -vvvv
ansible-playbook setup.yml