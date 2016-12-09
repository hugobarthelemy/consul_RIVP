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

### with email
Mailler in Devise
When you use sending meail with devise, you need to use a worker. For that, used gem 'thin'
https://github.com/macournoyer/thin

It's alrady install in Consul code but you need to activate the worker on your server with :
> $ rake jobs:work &

for check if it's fonctionnal:
> $ ps aux | grep ruby
### Twitter connect

### Facebook connect

## verification

### postal code

In "app/models/custom/verification/residence.rb" configure the check of postal code with a regex 
> def valid_postal_code?   
> <Enter> postal_code =~ /^280/  
> <Enter> end


### census API

## levels of user

On basic Consul, you have 3 type of users:
| type of user | name               | type of verification      |
| -------------|:------------------:| ------------------------: |
| user level 1 | user no verified   | mail OR social connect    |
| user level 2 | user verified      | API AND mobile phone      |
| user level 3 | ?                  | postal mail               |

## type of official people
| type of official people | es | en | fr |
| ----------------------- |:--:|:--:|--:|
| official_level_1_name   | | Mayor | Le maire |
| official_level_2_name   | |       | Conseiller|
| official_level_3_name   | |
| official_level_4_name   | |
| official_level_5_name   | |

officials people don't have a specific right but they have 
## organisation
It's association

## type of admin
### admin
He have all of right

moderator
valuator
officiel

| authorisation                             | moderator | valuator  | officiel  | admin |                                
| ------------------------------------------|:---------:|:---------:|:---------:|------:|
| write a proposition                       | yes       | no        | yes       | yes   |
| modified proposition                      | yes       | no        | yes       | yes   |
| deleted proposition                       | yes       | no        | yes       | yes   |
| write a comment                           | yes       | no        | yes       | yes   |
| Write a comment for an other persone      | yes       | no        | yes       | yes   |
| modified a comment                        | yes       | no        | yes       | yes   |
| modified a coment of an other user        | yes       | no        | yes       | yes   |
| deleted a comment                         | yes       | no        | yes       | yes   |
| deleted a comment of an other personne    | yes       | no        | yes       | yes   |
| define the cost of the proposition        | no        | yes       | no        | yes   |


How to define a moderator / valuator / official


## configurate vote / comment / ratio

# How to deploy
## On server Ubuntu 14.04
We use gem thin
Tuto is here: https://github.com/macournoyer/thin

add in the gemfile : 
gem 'thin'
> $ bundle install

in the server too: $ bundle install
> $ thin config -C config/thin.yml
> <Enter> $ vi thin.y^C
> <Enter> $ cd config/
> <Enter> $ vi thin.yml
> <Enter> $ thin start -C config/thin.yml -b ^C
> <Enter> $ cd ..
> <Enter> $ thin start -C config/thin.yml -a 213.246.57.34
> <Enter> $ ps aux | grep ruby
> <Enter> $ ps aux | grep thin
> <Enter> $ exit # deconection of the server
# How you use
# How you manage