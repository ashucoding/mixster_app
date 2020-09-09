# README

# Mixster App

Mixster is an app where people can rate/comment their favorite drinks. Ideally 
the user will visit a bar or coffee shop such as starbucks, logon to the app,
upload a picture and give a description of the drink which includes ingredients,
taste profile, location and even the bartender/barista's name. The app is also 
designed so that other users read comments or logon and comment on the drink created. 


## Architecture and models

Effect Model used for this project was the MVC CRUD model. Users have the ability 
CRUD(Create, Read, Update and Destroy drinks and reviews). The app folders are organized 
by MVC (Model View Controller) making it easier for developers to find folers as well as 
the app communicating within levels of itself. 


## Development

## Prerequisites
The setups steps expect following tools installed on the system.

Github
Ruby 2.6.1
Rails 6.0.3.2
1. Check out the repository
git clone https://github.com/ashucoding/mixster_app

2. Create database.yml file
Copy the sample database.yml file and edit the database configuration as required.

cp config/database.yml.sample config/database.yml

3. Create and setup the database
Run the following commands to create and setup the database.

bundle exec rake db:create
bundle exec rake db:setup

4. Start the Rails server
You can start the rails server using the command given below.

bundle exec rails s or rails s
And now you can visit the site with the URL http://localhost:3000

5. Look at the Gemfile. Make sure all gems are installed. 



