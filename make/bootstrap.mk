#####################
##@ Bootstrapping
#####################

install: ## Install required tooling on your local machine to run/manage this application stack
	@echo "Installing dependencies"

configure: ## Run through configuration script to bootstrap your  environment
	@echo "Configuring Homelab Builder Environment"

set-env: log ## Set the environment you wish to run Homelab Builder against (useful for creating extra stacks)
	@echo "️🏠 Enter the name of the environment you wish to use (default production): " && \
	   read ans && \
	   sed -i '' -E "s/ENVIRONMENT=.*/ENVIRONMENT=$${ans}/" .env