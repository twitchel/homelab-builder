.DEFAULT_GOAL := help

# Make bootstrapping
PROJECT_ROOT:=$(shell pwd)
MAKE_LIB:=$(PROJECT_ROOT)/make
-include $(MAKE_LIB)/bootstrap.mk
-include $(MAKE_LIB)/infrastructure.mk
-include $(MAKE_LIB)/stack-management.mk
-include $(MAKE_LIB)/utils.mk

# Variables powering environment
DEBUG ?= false
ENVIRONMENT ?= 'dev'

#####################
##@ Kick off
#####################

autorun: log install configure infra-build deploy start ## Run all steps to get the stack deployed and running