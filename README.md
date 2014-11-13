# PassTy: web application to keep your passwords in one place behind firewall install 

[![Build Status](https://travis-ci.org/randx/passty.png)](https://travis-ci.org/randx/passty)
[![Coverage Status](https://coveralls.io/repos/randx/passty/badge.png)](https://coveralls.io/r/randx/passty)
[![Code Climate](https://codeclimate.com/github/randx/passty.png)](https://codeclimate.com/github/randx/passty)

![screenshot](http://blog.dzaporozhets.me/content/images/2014/Jun/Screenshot-2014-06-08-10-44-51.png)

## Requirements:

* Ruby 1.9+
* PostgreSQL database

## Setup:


### Heroku:

    heroku create
    heroku config:set BUNDLE_WITHOUT="development:test:sqlite:mysql"
    heroku addons:add heroku-postgresql
    git push heroku master
    heroku run rake db:migrate

### Manually:


#### Setup user and database

Install database and libs


    # Install PostgreSQL and libs 
    sudo apt-get install postgresql postgresql-client libpq-dev


Create user for application

    sudo adduser --disabled-login --gecos 'Passty' passty

    # Login to PostgreSQL
    sudo -u postgres psql -d template1

    # Create a user for Passty
    # Do not type the 'template1=#', this is part of the prompt
    template1=# CREATE USER passty CREATEDB;

    # Quit the database session
    template1=# \q


#### Setup application

Switch to `passty` user before application setup

    sudo su passty    


1. Get code

        cd ~
        git clone https://github.com/randx/passty.git
        cd passty


2. Install database and configure application


        # Set database settings in Passty config
        cp config/database.yml.postgresql config/database.yml

        # change db settings if necessary (optional)
        vim config/database.yml


3. Setup libs, migrations etc

        # Install gems and create database
        bundle install --deployment --without development test mysql sqlite
        bundle exec rake db:create RAILS_ENV=production
        bundle exec rake db:setup RAILS_ENV=production
        bundle exec rake assets:precompile RAILS_ENV=production 

4. Run application on socket

        bundle exec puma -e production -b unix:///home/passty/application.socket


5. Setup nginx

        # Install webserver
        sudo apt-get install nginx

        # Create file for application and use config below
        sudo vim /etc/nginx/sites-enabled/passty


    Use this example for nginx config:


        upstream passty {
          server unix:/home/passty/application.socket fail_timeout=0;
        }

        server {
          listen *:80 default_server;
          server_name YOUR_DOMAIN_NAME;
          server_tokens off;
          root /home/passty/passty/public;

          location / {
            try_files $uri $uri/index.html $uri.html @passty;
          }

          location @passty {
            proxy_redirect      off;
            proxy_set_header    Host                $http_host;
            proxy_set_header    X-Real-IP           $remote_addr;
            proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
            proxy_set_header    X-Forwarded-Proto   $scheme;
            proxy_set_header    X-Frame-Options     SAMEORIGIN;

            proxy_pass http://passty;
          }
        }


- - -

Pull Requests are welcome :)


### Other databases support

You can use mysql or sqlite too. Just copy db config and use 
bundle install matching your database type


### Update from older versions:

1. Get version you want

        git fetch
        git checkout LATEST_VERSION


2. Install libs and migration

        bundle
        bundle exec rake db:migrate RAILS_ENV=production
    
3. Start application
    
