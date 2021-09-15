# Treasure Hunt

A token based api for a treasure hunt game.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development.

### Prerequisites

Things you need to install the project.

```
Postgres 	>= 9.6.12
Ruby 		== 3.0.0
Rails		== 6.1.4
Redis           >= 6.2.5
```

#### How to install:

- [Ruby and Rails](https://gorails.com/setup/ubuntu/20.04)
- [PostgreSQL](https://www.postgresql.org/download/linux/ubuntu/)
- [Redis](https://redis.io/topics/quickstart)

### Installing

How to setup the environment:

1 - Clone the project

```
git clone git@github.com:muromeo1/treasure_hunt_game.git
```

2 - Change config/database.yml to your postgres username and password

```
default: &default
  adapter: postgresql
  encoding: unicode
  database: your_database_name
  username: yout_database_username
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  host: localhost
  password: your_databse_password
```

3 - Setup database

```
rails db:setup
```

4 - Run the project

```
rails s
```

Good to go!

## Creating a new user
Route: 
```
POST http://localhost:3000/api/v1/users/
```
Body:
```json
{
	"name": "Coop",
	"email": "tars@endurance.com",
	"password": "gravity",
	"password_confirmation": "gravity"
}
```
Response:
```json
{
  "status": "ok",
  "token": "yJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzQ0NzE0MzV9.RPOt01FcfER6tTbClsHq5GTKbx3HWfOAYHy9YV4YmlQ"
}
```

## Authentication
Route: 
```
POST http://localhost:3000/api/v1/users/authenticate
```
Body:
```json
{
	"email": "tars@endurance.com",
	"password": "gravity"
}
```
Response:
```json
{
  "status": "ok",
  "token": "yJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzQ0NzE0MzV9.RPOt01FcfER6tTbClsHq5GTKbx3HWfOAYHy9YV4YmlQ"
}
```

## Author

**Murilo Romeo** - *Ruby on Rails developer* - [muromeo1](https://github.com/muromeo1)
