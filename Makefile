.PHONY: build up down clean setup

setup:
	@mkdir -p /home/kerberso/Desktop/Inception/data/wp
	@mkdir -p /home/kerberso/Desktop/Inception/data/db
	@echo "Dossiers '/home/kerberso/Desktop/Inception/data/wp' et '/home/kerberso/Desktop/Inception/data/db' créés ou déjà existants"


build: setup
	@docker-compose -f ./srcs/docker-compose.yml build

up: build
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune -af
	docker volume rm srcs_mariadb srcs_wordpress
