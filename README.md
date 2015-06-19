### Vagrant (Ubuntu 14.04)
This uses Ansible as the provisioner in a different way than as documented on Vagrant's website. Instead of needing to install Ansible on your host machine, this will download and build Ansible inside the VM, and then execute on itself. This makes it a helluvalot more portable.

#### Usage

1. Clone this repo and put it in a `vagrant` dir in your project root.

	MyProjectRoot/
		vagrant/
			README.MD (this file)

Ideally, check out as a submodule into your master project: `git submodule add -b master git@github.com:jhartman86/vagrant-ansible.git vagrant`. The `-b` flag will force it to track only the master branch. (Good reference: http://www.vogella.com/tutorials/Git/article.html#submodules)

2. In the `vagrant/provisioning` directory, copy or rename the file `setup.sample.yml` to `setup.yml`. Then modify the setup.yml file per your project needs. Documentation is included in the comments and hopefully its fairly straight forward. Note that the setup.yml file will NOT be tracked in version control by default; if you are working on a project team you probably want it checked in so everyone can build the exact same machine, so just remove the line from .gitignore.

3. `$: cd vagrant && vagrant up` will build and provision the VM with everything install :)