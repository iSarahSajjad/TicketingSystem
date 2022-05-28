#!/bin/bash

WORKING_DIR=${PWD##*/}

# Colour
NC='\033[0m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'

echo -e "${CYAN}${NC} Copy docker compose ${YELLOW}${NC}"
cp docker-compose.yml.example docker-compose.yml

echo -e "${CYAN}${NC} Copy .env file ${YELLOW}${NC}"
cp .env.example .env
#sudo sysctl -w vm.max_map_count=262144

echo -e "${CYAN}${NC} Build docker-compose ${YELLOW}${NC}"
docker-compose build
docker-compose stop
docker-compose up -d

echo -e "${CYAN}${NC} Run docker-compose ps to check the status of running containers ${YELLOW}${NC}"

echo -e "${CYAN}${NC} Run install script to install ticketing system  ${YELLOW}${NC}"

docker exec -it ticketing-app bash -c "composer install"

echo -e "${CYAN}${NC} Generating app key  ${YELLOW}${NC}"
docker exec -it ticketing-app bash -c "php artisan key:generate"

echo -e "${CYAN}${NC} Migrating Database  ${YELLOW}${NC}"
docker exec -it ticketing-app bash -c "php artisan migrate"
docker exec -it ticketing-app bash -c "php artisan passport:install"
docker exec -it ticketing-app bash -c "php artisan db:seed"

echo -e "${CYAN}${NC} Install npm packages and dev  ${YELLOW}${NC}"
docker exec -it ticketing-app bash -c "npm install"
docker exec -it ticketing-app bash -c "npm run dev"

echo -e "${CYAN}${NC} Installation done. Access localhost:8000 ${YELLOW}${NC}"
echo -e "\n"
