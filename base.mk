.EXPORT_ALL_VARIABLES:

SHELL := /usr/bin/env bash

PROJECT_ROOT := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

CURRENT_DATETIME = $(shell date +%F.%H%M%S)
CURRENT_TIME = $(shell date +%H:%M:%S)

FONT_BLACK := \033[30m
FONT_BLUE := \033[34m
FONT_CYAN := \033[36m
FONT_GREEN := \033[32m
FONT_NEUTRAL := \033[0m
FONT_PURPLE := \033[35m
FONT_RED := \033[31m
FONT_WHITE := \033[1;37m
FONT_YELLOW := \033[1;33m

GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
GIT_COMMIT_HASH := $(shell git rev-parse HEAD)

LOG_ERROR = echo -e "${CURRENT_TIME} [ ${FONT_RED}ERROR${FONT_NEUTRAL} ]"
LOG_INFO = echo -e "${CURRENT_TIME} [ ${FONT_GREEN}INFO${FONT_NEUTRAL} ]"
LOG_WARN = echo -e "${CURRENT_TIME} [ ${FONT_YELLOW}WARN${FONT_NEUTRAL} ]"

.DEFAULT_GOAL: help
include $(PROJECT_ROOT)/help/help.mk

BUILD_COMMAND = $(LOG_INFO) Set the variable BUILD_COMMAND in your Makefile to the command used to build the binary.
build: test #info: Build executable
	@$(BUILD_COMMAND)
