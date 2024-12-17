#####################
##@ Infrastructure
#####################

infra-build: log confirm ## Builds the base level VM infrastructure in Proxmox
	@echo "🚧 Building infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml -vv ansible/infrastructure-build.yml

infra-destroy: log confirm ## Destroys the entire VM swarm stack, along with all your data
	@echo "🧨 Destroying infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml -v ansible/infrastructure-destroy.yml