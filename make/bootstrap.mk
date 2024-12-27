#####################
##@ Bootstrapping
#####################

INSTALL_TOOLS=ansible jq yq opentofu

install: log ## Install required tooling on your local machine to run/manage this application stack
	@echo "Installing dependencies"
	@if command -v brew > /dev/null 2>&1; then \
        brew install $(INSTALL_TOOLS); \
 	fi; \
    if command -v apt > /dev/null 2>&1; then \
		sudo apt-get install -y $(INSTALL_TOOLS); \
	fi;

configure: log ## Run through configuration script to bootstrap your environment
	@echo "Configuring Homelab Builder Environment"

set-env: log ## Set the environment you wish to run Homelab Builder against (useful for creating extra stacks)
	@echo "️🏠 Enter the name of the environment you wish to use (default production): " && \
	   read ans && \
	   sed -i '' -E "s/ENVIRONMENT=.*/ENVIRONMENT=$${ans}/" .env