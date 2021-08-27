# MappingWizard

An example app to experiment with some frontend features of our DemographicsMapper app.

## How to run the app

The app is dockerized. You need to run the following commands:

- `docker compose build`
- `docker-compose run --rm web bundle install`
- `docker-compose run web bundle exec rails db:create`
- `docker-compose run --rm web bundle exec rails db:migrate`
- `docker-compose up`
