# Sinatra Fwitter 3 -  Databases

## Outline

1. Add Gems to our gemfile - `activerecord`, `sinatra-activerecord`, `rake`, `tux`, and `sqlite3`
2. Connect to our database in `config/environment.rb`
3. Create a migration for a table called `tweets` with up and down methods. The table should have columns for username and status. 
4. Migrate the database and update the tweet model so that it inherits from ActiveRecord::Base. Comment out or remove all of the methods and attributes. 
5. Update the application controller to use hash syntax to create new tweets. 

## Objectives

1. Create a connection to a sqlite database with activerecord in a Sinatra application.
2. Understand how to use ActiveRecord migrations to create a table. 
3. Update and use a model inheriting from ActiveRecord::Base. 
4. Create and persis tweets in our database

## Overview
We're back for Fwitter Part 3! We'll be incorporating a database into our application so we can persist out tweets.

## Instructions

### Setup
Fork and clone this repository to get started. 

### Updating Our Gemfile
First, we'll add some gems to our Gemfile that we'll need to setup our database. `activerecord` and `sinatra-activerecord` will setup our ActiveRecord magic for us, `rake` will help us easily create migration files for setting up our tables. We'll also be using `sqlite3` as our flavor of SQL in development.

```ruby
source "https://rubygems.org"

gem "sinatra"
gem "activerecord"
gem "sinatra-activerecord"
gem "rake"

group :development do
  gem "pry"
  gem "tux"
  gem "shotgun"
  gem "sqlite3" 
end
```

Run `bundle install` to add any needed gems and dependencies. 

### Connecting to our Database

Next, we need to setup a connection to our database. In our `environment.rb` file, add the following block of code. 

```ruby
require 'bundler'
Bundler.require

configure :development do
  set :database, "sqlite3:db/database.db"
end
```

### Setting up our Rakefile

We'll use `rake` to help us create our database and tables. Rake stands for "Ruby Make" - it's basically a way to make and automate certain tasks. From the terminal, run `rake -T` - you should see something like the following output: 

```bash
rake aborted!
No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)
/Users/iancandy/.rvm/gems/ruby-2.2.1/bin/ruby_executable_hooks:15:in `eval'
/Users/iancandy/.rvm/gems/ruby-2.2.1/bin/ruby_executable_hooks:15:in `<main>'
(See full trace by running task with --trace)
```

This is because we don't have a Rakefile. Let's fix this error by creating one. Create a file called `Rakefile` in the root of this directory and add the following code snippets: 

```ruby
require 'sinatra/activerecord/rake'
require './config/environment' 
```

This will add the ActiveRecord rake tasks into our project. Save this file and run `rake -T` again - you should see a list of the available tasks.

```bash
rake db:create              # Creates the database from DATABASE_URL or con...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or confi...
rake db:fixtures:load       # Load fixtures into the current environment's ...
rake db:migrate             # Migrate the database (options: VERSION=x, VER...
rake db:migrate:status      # Display status of migrations
rake db:rollback            # Rolls the schema back to the previous version...
rake db:schema:cache:clear  # Clear a db/schema_cache.dump file
rake db:schema:cache:dump   # Create a db/schema_cache.dump file
rake db:schema:dump         # Create a db/schema.rb file that is portable a...
rake db:schema:load         # Load a schema.rb file into the database
rake db:seed                # Load the seed data from db/seeds.rb
rake db:setup               # Create the database, load the schema, and ini...
rake db:structure:dump      # Dump the database structure to db/structure.sql
rake db:version             # Retrieves the current schema version number
``` 

## Resources

* [Stack Exchange](http://www.stackexchange.com) - [Some Question on Stack Exchange](http://www.stackexchange.com/questions/123)