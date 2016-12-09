# What is Consul ?
Consol is a open source participatory budget platform.
# History of the project
You can look at the site deployed in Madrid here: https://decide.madrid.es/
# What is the different module of Consul
## budget
# Big steps of consultation
Inline-style: 
![alt text](https://github.com/hugobarthelemy/consul_RIVP/app/assets/doc/generalprocess.png "general process")

1. Registration 
2. Write a proposal
3. Amending a proposal
4. Budgeting a proposal
5. Vote for a proposal
6. Publication of results of the consultation
# How to install
# Configuration
## Connection
### email
Mailler in Devise
### Twitter connect

### Facebook connect

## verification

### postal code

In "app/models/custom/verification/residence.rb" 
     def valid_postal_code?
 -      postal_code =~ /^280/
      end


### census API

## levels of user

| authorisation                 | simple user   | level 1 | level 2 | level 3 | level 4 | level 5 | admin |                                
| ------------------------------|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:| -----:|
| variable for change the name  |
| See all propositions          |
| vote for a proposition        |
| post a proposition            |
| commente a proposition        |
| change your proposition       |


## configurate vote / comment / ratio

# How to deploy
## On server Ubuntu 14.04
We use gem thin
Tuto is here: https://github.com/macournoyer/thin

add in the gemfile : 
gem 'thin'
$ bundle install
in the server too: $ bundle install
$ thin config -C config/thin.yml
$ vi thin.y^C
$ cd config/
$ vi thin.yml
$ thin start -C config/thin.yml -b ^C
$ cd ..
$ thin start -C config/thin.yml -a 213.246.57.34
$ ps aux | grep ruby
$ ps aux | grep thin
$ exit # deconection of the server
# How you use
# How you manage