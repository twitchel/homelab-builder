.DEFAULT_GOAL := help

# Import variables powering environment from `.env` file
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Set default values for env
DEBUG ?= false
ENVIRONMENT ?= 'production'

# Make bootstrapping
PROJECT_ROOT:=$(shell pwd)
MAKE_LIB:=$(PROJECT_ROOT)/make
-include $(MAKE_LIB)/bootstrap.mk
-include $(MAKE_LIB)/infrastructure.mk
-include $(MAKE_LIB)/stack-management.mk
-include $(MAKE_LIB)/utils.mk

#####################
##@ Kick off
#####################

autorun: log confirm install configure infra-build deploy start ## Run all steps to get the stack deployed and running