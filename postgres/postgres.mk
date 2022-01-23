DATABASE_VOLUME_NAME?=$(shell basename "$$PWD")-database

clean.db: stop.db #info: Remove persisted database
	@$(PROJECT_ROOT)/postgres/clean

deploy.db: #info: Run Flyway migrations
	@$(PROJECT_ROOT)/postgres/migrate

start.db: #info: Start database container
	@$(PROJECT_ROOT)/postgres/start

stop.db: #info: Stop database container
	@$(PROJECT_ROOT)/postgres/stop
