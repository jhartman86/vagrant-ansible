### Vagrant / Ansible Drop-In
Basic LAMP stack with some extras, and easy configuration on a per-project basis. Recommended usage: clone this as a submodule into your project root in `vagrant` directory.

	MyProject/
		...
		vagrant/

From your project root:
* `$: git submodule add -b master https://github.com/jhartman86/vagrant-ansible.git vagrant`
	* ^ "yo git, clone the submodule, make sure to track it on the master branch, and put into directory **vagrant**".
* Copy `vagrant-configs.sample.rb` and `vagrant-setup.sample.yml` to your project root, and remove `.sample`, respectively.
	* Customize files as you see fit (defaults should be acceptable
	for vast majority of standard LAMP-ish projects).
	* The files in your project root (renamed from .sample.x) **should be** checked into version control!
* `$: vagrant up` from the vagrant directory.
