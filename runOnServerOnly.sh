#Run this on the ec2 server from the application root directory
#/var/www/Suppr/production/current/
#/var/www/Suppr/staging/current/
bundle install --without development test;
rake assets:precompile RAILS_ENV=production
sudo service httpd restart
sudo chmod 0700 *.sh
