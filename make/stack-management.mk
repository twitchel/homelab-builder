#####################
##@ Stack Management
#####################

deploy: log preflight-checks confirm ## This will deploy the swarm stack to your hosts. This can be rerun to add new services
	@echo "🥞 Deploying Homelab Stack"
	@ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/stack-deploy.yml

deploy-sensors: log preflight-checks confirm ## This will deploy the sensor stack (Zigbee/Zwave) to the defined host.
	@echo "🤖 Deploying sensors"
	@echo "NOT IMPLEMENTED YET"