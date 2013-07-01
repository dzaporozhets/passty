## PassTy: web application to keep your passwords in one place behind firewall install 


### Requirements:

* ruby 1.9+
* mysql db

### Setup:


1. Get code

        git clone https://github.com/randx/passty.git
        cd passty


2. Copy database.yml and edit mysql user/password


        cp config/database.yml.example config/database.yml
        vim config/database.yml


3. Setup libs, migrations etc

        bundle install --deployment --without development test
        bundle exec rake db:create RAILS_ENV=production
        bundle exec rake db:setup RAILS_ENV=production
        bundle exec rake assets:precompile RAILS_ENV=production 

4. Run application on 3000 port
        
        bundle exec rails s -e production -p 3000


- - -

Pull Requests are welcome :)
