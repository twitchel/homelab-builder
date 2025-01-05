#####################
##@ Stack Management
#####################

deploy: log preflight-checks confirm ## This will deploy the swarm stack to your hosts . This can be rerun to add new services
	@echo "🥞 Deploying Homelab Stack"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml ansible/stack-deploy.yml

start: log preflight-checks confirm ## This starts the application stack
	@echo "🐝 Starting stack"

stop: log preflight-checks confirm ## This stops the application stack
	@echo "✋ Stopping stack"