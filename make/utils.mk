#####################
##@ Utilities
#####################

ANSIBLE_INSTALLED := $(shell command -v ansible 2> /dev/null)
TOFU_INSTALLED := $(shell command -v tofu 2> /dev/null)

log: ## log env vars
	@echo "\n======================================================\n"
	@echo "ENVIRONMENT          $(ENVIRONMENT)"
	@echo "PROJECT_ROOT         $(PROJECT_ROOT)"
	@echo "DEBUG                $(DEBUG)"
	@echo "\n======================================================\n"

confirm: log
	@echo "⚠️ Please confirm your environment and other details above. Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]

confirm-danger: log
	@echo "⚠️ Please confirm your environment and other details above. Enter env name to continue (from above) " && read ans && [ $${ans:-N} = $(ENVIRONMENT) ]

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: log ## This help.
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

preflight-checks: log
ifndef ANSIBLE_INSTALLED
	$(error "Ansible is not installed, please install")
endif
ifndef TOFU_INSTALLED
	$(error "OpenTofu is not installed, please install")
endif
	@if [[ ! -f "./ansible/inventory/$(ENVIRONMENT)/group_vars/all.yml" ]]; then \
	 	echo "Group vars directory for environment missing" && exit 1; \
	fi
	@if [[ ! -f "./ansible/inventory/$(ENVIRONMENT)/hosts.yml" ]]; then \
		echo "Hosts data for environment missing" && exit 1; \
	fi