
# HairGuitar

Test Project for WeCasa: Haircut booking platform

[![CircleCI](https://circleci.com/gh/Christophe-Junier/HairGuitar.svg?style=svg&circle-token=213527000e0c50498dd637b0ea77f7c7e586bacc)](https://circleci.com/gh/Christophe-Junier/HairGuitar)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)
[![codecov](https://codecov.io/gh/Christophe-Junier/HairGuitar/branch/develop/graph/badge.svg)](https://codecov.io/gh/Christophe-Junier/HairGuitar)



##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.1](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/)
- Rails [6.0.3](https://guides.rubyonrails.org/getting_started.html)
- Postgresql[Installation on linux systems](https://www.veremes.com/installation-postgresql-linux)
- Google API Key [Comment ça marche ?](https://developers.google.com/maps/documentation/javascript/get-api-key)


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

1- Put the json file on the root of the project /HairGuitar (the file MUST be named data.json)

2- Run the following commands to seed the database.

```ruby
  rake db:json:import
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
