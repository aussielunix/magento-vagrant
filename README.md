# mustached-batman

Collection of tools for building out a testable product development workflow.  


## Workflow

A bug or feature ticket is created

* write some integration tests of how the new feature should work from the outside looking in
* be vagrant up
* be vagrant rspec
* watch them fail

Rinse and repeat the following cycle till tests pass:

* add changes to the vagrant shell provisioner
* be vagrant destroy -f && be vagrant up
* OR be vagrant provision
* be vagrant rspec

Now that you have blackbox tests working you are able to confidently make changes to the 'blackbox'  
You are free to make changes to the implementation of the blackbox whilst knowing the black box  
is still doing exactly what the product description says it should.  

You can now finalise the box provisioning into proper puppet manifests(if not already) and should  
write a bunch of unit tests 9serverspec) to ensure that the provisioning comepletes properly each time.

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
