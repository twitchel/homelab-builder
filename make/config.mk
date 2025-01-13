#####################
##@ Configuration
#####################

CONFIG_PATH="ansible/group_vars/$(ENVIRONMENT)/main.yml"
HOSTS_PATH="config/$(ENVIRONMENT)/hosts.yml"

config-bootstrap: log ## Run through configuration script to bootstrap your environment
	@echo "Configuring Homelab Builder Environment"

config-edit-vars: confirm ## Edit the configuration for the homelab stack and recipes
	@if which xdg-open &> /dev/null; then \
        xdg-open "$(CONFIG_PATH)"; \
    else \
        open "$(CONFIG_PATH)"; \
    fi;

config-edit-hosts: confirm ## Edit the host configuration for the homelab stack
	@if which xdg-open &> /dev/null; then \
        xdg-open "$(CONFIG_PATH)"; \
    else \
        open "$(CONFIG_PATH)"; \
    fi;

set-env: log ## Set the environment you wish to run Homelab Builder against (useful for creating extra stacks)
	@echo "️🏠 Enter the name of the environment you wish to use (default production): " && \
	   read ans && \
	   sed -i '' -E "s/ENVIRONMENT=.*/ENVIRONMENT=$${ans}/" .env