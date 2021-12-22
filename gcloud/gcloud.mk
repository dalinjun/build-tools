MAKEFILE_ROOT=$(PROJECT_ROOT)/gcloud

start.pubsub: #info: Start pubsub emulator
	@$(MAKEFILE_ROOT)/start-pubsub

stop.pubsub: #info: Stop pubsub emulator
	@$(MAKEFILE_ROOT)/stop-pubsub
