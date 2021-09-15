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

#### Guide to install:

- [Ruby and Rails](https://gorails.com/setup/ubuntu/20.04)
- [PostgreSQL](https://www.postgresql.org/download/linux/ubuntu/)
- [Redis](https://redis.io/topics/quickstart)

### Installing and Running

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
GET http://localhost:3000/api/v1/users/authenticate
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

## Send location
Route: 
```
POST http://localhost:3000/api/v1/treasure_hunt
```
Body:
```json
{
  "current_location": ["0", "0"],
  "email": "tars@endurance.com"
}
```
Response:
```json
{
  "status": "ok",
  "distance": 343
}
```

## Analytics
Route: 
```
GET http://localhost:3000/api/v1/analytics
```
Body:
```json
{
  "start_time": ["2020-09-23 12:00:00"],
  "end_time": "2020-09-24 19:00:00",
  "radius": 1000
}
```
Response:
```json
{
  "status": "ok",
  "requests": [
    { "email": "tars@endurance.com", "current_location": ["2", "-8"] },
    { "email": "coop@stay.com", "current_location": ["87", "-2"] }
  ]
}
```

## Author

**Murilo Romeo** - *Ruby on Rails developer* - [muromeo1](https://github.com/muromeo1)
