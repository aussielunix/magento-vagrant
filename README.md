# mustached-batman

Collection of tools for building out a testable product development workflow.  


## Workflow

A bug or feature ticket is created

* write some integration test of how the new feature should work from the outside looking in
* be vagrant up
* be vagrant rspec
* watch them fail

Rinse and repeat the following cycle till tests pass:

* add changes to puppet
* be vagrant destroy -f
* be vagrant up
* be vagrant rspec
* commit changes to git and push

OR

* add changes to puppet
* be vagrant provision
* be vagrant rspec
* commit changes to git and push

release to production and Profit !

There are rake tasks for the various tests too.

* be rake spec:unit
* be rake spec:integration

## Tools

* puppet
* vagrant
* vagrant-rspec-ci
* rspec
* capybara
* poltergeist
* serverspec

