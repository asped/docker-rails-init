#!/bin/bash
docker-compose run --no-deps web rails new . --force --database=postgresql

sudo chown -R $USER:$USER .
docker-compose build
cp database.yml.sample config/database.yml
docker-compose up -d

docker-compose down
docker-compose run web rake db:create

