#####################
##@ Utilities
#####################

log: ## log env vars
	@echo "\n======================================================\n"
	@echo "ENVIRONMENT          $(ENVIRONMENT)"
	@echo "PROJECT_ROOT         $(PROJECT_ROOT)"
	@echo "DEBUG                $(DEBUG)"
	@echo "\n======================================================\n"

confirm: log ## Confirm before running
	@echo "⚠️ Please confirm your environment and other details above. Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: log ## This help.
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
