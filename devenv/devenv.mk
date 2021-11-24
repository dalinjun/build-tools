BOOTSTRAP_INIT_FOUND := $(shell ! grep -q -e "^bootstrap.init:" $(word 1,$(MAKEFILE_LIST)); echo $$?)
BOOTSTRAP_POST_FOUND := $(shell ! grep -q -e "^bootstrap.post:" $(word 1,$(MAKEFILE_LIST)); echo $$?)

CONFIG_EMAIL_FILE = $(CONFIG_HOME)/email
CONFIG_FULLNAME_FILE = $(CONFIG_HOME)/fullname
CONFIG_HOME = $(HOME)/.config/dalinjun

bootstrap:: #info: Bootstrap development environment
ifeq ($(BOOTSTRAP_INIT_FOUND),1)
	@make bootstrap.init
endif

	@$(PROJECT_ROOT)/devenv/bootstrap

ifeq ($(BOOTSTRAP_POST_FOUND),1)
	@make bootstrap.post
endif
