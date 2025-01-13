#####################
##@ Infrastructure
#####################

infra-build: log confirm preflight-checks ## Builds the base level VM infrastructure in Proxmox
	@echo "🚧 Building infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-build.yml

infra-provision: log confirm preflight-checks ## Provisions the nodes used for the swarm (install software)
	@echo "🚧 Provisioning nodes"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-provision.yml

infra-destroy: log confirm-danger preflight-checks ## Destroys the entire VM swarm stack, along with all your data
	@echo "🧨 Destroying infrastructure"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-destroy.yml