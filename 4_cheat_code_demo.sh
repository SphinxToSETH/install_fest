

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Demo git to heroku push ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"


rails new myapp
cd myapp/

#

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== modif sqlit3 ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"
rm -rf Gemfile

/bin/echo -e "\e[36m Inside this file, change the line: \e[0m"
#
/bin/echo -e "\e[36m gem 'sqlite3' \e[0m"
#
/bin/echo -e "\e[36m To this: \e[0m"

/bin/echo -e "\e[36m group :development, :test do \e[0m"


/bin/echo -e "\e[36m  gem 'sqlite3'\e[0m"

/bin/echo -e "\e[36mend\e[0m"

/bin/echo -e "\e[36mgroup :production do\e[0m"

/bin/echo -e "\e[36m  gem 'pg'\e[0m"

/bin/echo -e "\e[36mend\e[0m"

#
/bin/echo -e "\e[36mSave the file.\e[0m"
sleep 4

cat << GOD >> Gemfile
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'pg'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'listen'
end 
GOD

#bundle update
#bundle install
rails generate scaffold drink name:string temperature:integer
rake db:migrate

bundle install --without production

cat << GG >> config/routes.rb
Rails.application.routes.draw do
  root 'drinks#index'
end
GG
#

#
/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== git push ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

#
git init
git add .
git commit -m "commit $(date | cut -c1-24)"

/bin/echo -e "\e[36mMerci de mettre le nom de votre account github https://github.com/YOURNAME/youapp.git :\e[0m"
read account
git remote add origin "$account"
git push -u origin master
#>> mdp <<

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== heroku create and deploye ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

heroku login
create_app="$(heroku create  2>&1 | cut -c23- | head -n 1)"
heroku apps:list
heroku git:remote -a $create_app
git push heroku master
heroku run rake db:migrate
heroku open

#>> end <<
