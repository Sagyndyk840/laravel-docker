.PHONY: help
help:
	@echo 'make help - help'
	@echo 'make build - Build docker compose file'
	@echo 'make start - up docker compose file'
	@echo 'make stop - stop and remove all containers'
	@echo 'make restart - stop and remove all containers'
	@echo 'make sh - set container name'

start:
	docker compose up -d

up-build:
	docker compose up -d --build

stop:
	docker compose down --remove-orphans

restart:
	make stop
	make start

bash:
	docker compose exec app bash

fresh:
	docker compose exec app php artisan migrate:fresh --seed

key:
	docker compose exec app php artisan key:generate

storage:
	docker compose exec app php artisan storage:link

install:
	@make stop
	@make up-build
	docker compose exec app composer install
	docker compose exec app php artisan storage:link
	@make fresh
