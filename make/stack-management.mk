#####################
##@ Stack Management
#####################

deploy: log preflight-checks confirm ## This will deploy the swarm stack to your hosts. This can be rerun to add new services
	@echo "🥞 Deploying Homelab Stack"
	@ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml ansible/stack-deploy.yml

service-redeploy: log confirm
	@echo "️🏠 Enter the name of the service you wish to redeploy: " && \
    	read service_redeploy && \
		echo "🥞 Redeploying service: $${service_redeploy}" && \
		ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml --extra-vars="service_name=$${service_redeploy}" ansible/service-redeploy.yml

deploy-sensors: log preflight-checks confirm ## This will deploy the sensor stack (Zigbee/Zwave) to the defined host.
	@echo "🤖 Deploying sensors"
	@echo "NOT IMPLEMENTED YET"