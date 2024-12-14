#####################
##@ Infrastructure
#####################

infra-build: log ## Builds the base level VM infrastructure in Proxmox
	@echo "🏗️ Building infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml -k -v ansible/infrastructure-build.yml

infra-destroy: log ## Destroys the entire VM swarm stack
	@echo "💣 Destroying infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml -k -v ansible/infrastructure-destroy.yml