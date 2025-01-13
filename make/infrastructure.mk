#####################
##@ Infrastructure
#####################

infra-build: log confirm preflight-checks ## Builds the base level VM infrastructure in Proxmox
	@echo "🚧 Building infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-build.yml

infra-destroy: log confirm-danger preflight-checks ## Destroys the entire VM swarm stack, along with all your data
	@echo "🧨 Destroying infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-destroy.yml