#####################
##@ Infrastructure
#####################

infra-build: log confirm preflight-checks ## Builds the base level VM infrastructure in Proxmox
	@echo "🚧 Building infrastructure"
	@ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-build.yml

infra-provision: log confirm preflight-checks ## Provisions the nodes used for the swarm (install software)
	@echo "🚧 Provisioning nodes"
	@ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-provision.yml

infra-destroy: log confirm-danger preflight-checks ## Destroys the entire VM swarm stack, along with all your data
	@echo "🧨 Destroying infrastructure"
	@ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml ansible/infrastructure-destroy.yml