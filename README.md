### Vagrant Trusty 64 (Ubuntu 14.04) :: Ansible

Add this as a gitsubmodule into a PHP project (right now targeted @ Concrete5 builds)
and `$: cd vagrant && vagrant up` to get a working dev environment.

Clone as a submodule with:
`git submodule add -b master git@github.com:jhartman86/vagrant-ansible.git vagrant`

This will place a vagrant directory in your project root, set to track the master
branch of this repo. Then manage normally as a submodule.

Good reference: http://www.vogella.com/tutorials/Git/article.html#submodules

#### Usage

In the `/provisioning` directory, you'll find setup.sample.yml. Copy and rename to a
new file called `setup.yml` and customize from there. By default, the setup.sample.yml
file includes the whole kit and kaboodle. If you want to customize your builds, do so
in the copied setup.yml file. It will not be tracked in version control.