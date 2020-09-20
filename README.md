
# HairGuitar

Test Project for WeCasa: Haircut booking platform


##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.1](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/)
- Rails [6.0.3](https://guides.rubyonrails.org/getting_started.html)
- Postgresql[Installation on linux systems](https://www.veremes.com/installation-postgresql-linux)
 

##### 1. Check out the repository

```bash
- HTTPS: git clone https://github.com/Christophe-Junier/HairGuitar.git
- SSH:   git clone git@github.com:Christophe-Junier/HairGuitar.git
- CLI:   gh repo clone Christophe-Junier/HairGuitar
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4.1 Fill the database with seeds

Run the following commands to seed the database.

```ruby
bundle exec rake db:seeds
```

##### 4.2 Fill the database with json file

Run the following commands to seed the database.

```ruby
bundle exec rake json:import
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
