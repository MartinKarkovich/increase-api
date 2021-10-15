# Increase API

 * [Endpoint Documentation](https://documenter.getpostman.com/view/13130072/UV5WCdGs)


To run this application you will need to have installed.

* Ruby: 2.7.0
* Rails: 6.1.4.1
* Postgres: 12.8

# How to install

* Clone the repository and cd into it
* Set your PG username and password to match that of the app's
* To run the server use the command: bundle exec rails s
* To run the data=fetching background process use the command: sidekiq


# List of possible improvements

* Add proper exception handling
* Dockerize app for easier deployment
* Add validation (so far trusting that the data retrieved from the main API is trust-worthy)
* Create either a currency model or enum for future scalability
* Clean redundant code
* Have all services under one Service module
* Add testing
* Etc.
