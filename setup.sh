#!/bin/bash

# Start Docker containers
docker-compose up -d

# Install plugin dependencies
docker-compose exec redmine bundle config set without 'development test RAILS_ENV=production'

docker-compose exec redmine bundle install

# Run plugin migrations
docker-compose exec redmine bundle exec rake redmine:plugins NAME=redmine_agile RAILS_ENV=production

# Restart Redmine container
docker-compose restart redmine

echo "Setup complete! Redmine Agile plugin is installed and ready to use."