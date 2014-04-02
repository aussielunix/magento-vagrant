# mustached-batman

Collection of tools for building out a testable product development workflow.  


## Workflow

A bug or feature ticket is created

* write some integration test of how the new feature should work from the outside looking in
* vagrant up
* vagrant rspec
* watch it fail

Rinse and repeat the following cycle till tests pass:

* add changes to puppet
* vagrant destroy -f
* vagrant up
* vagrant rspec

Profit !

## Tools

* puppet
* vagrant
* vagrant-aws
* vagrant-rspec-ci
* rspec
* capybara
* poltergeist


