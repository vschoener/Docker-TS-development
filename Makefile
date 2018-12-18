all: clean down build

build:
	docker-compose build

build-nc:
	docker-compose build --no-cache

start:
	docker-compose up

start-bg:
	docker-compose up -d

stop:
	docker-compose stop

down: stop
	docker-compose down -v

clean: down
	rm -rf node_modules logs build

install:
	npm install
	@make build-app

build-app:
	docker-compose run --rm app npm run build

test:
	docker-compose run --rm app npm run test

log:
	docker-compose logs -f

ps:
	docker-compose ps

test:
	docker-compose run --rm app npm run test

installDep:
	npm install ${deps}
	docker-compose run --rm app npm install ${deps}

shell:
	docker-compose run --rm app bash
