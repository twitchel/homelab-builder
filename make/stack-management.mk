#####################
##@ Stack Management
#####################

deploy: log preflight-checks ## This will deploy the swarm stack to your hosts . This can be rerun to add new services
	@echo "🥞 Deploying Homelab Stack"
	@ansible-playbook -i config/$(ENVIRONMENT)/hosts.yml -vv ansible/stack-deploy.yml

start: log preflight-checks ## This starts the application stack
	@echo "🐝 Starting stack"

stop: log preflight-checks ## This stops the application stack
	@echo "✋ Stopping stack"