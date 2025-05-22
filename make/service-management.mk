#####################
##@ Service Management
#####################

service-redeploy: log confirm ## This will restart a service
	@echo "️🏠 Enter the name of the service you wish to redeploy: " && \
    	read service_redeploy && \
		echo "🥞 Redeploying service: $${service_redeploy}" && \
		ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml --extra-vars="service_name=$${service_redeploy}" ansible/service-redeploy.yml

service-destroy: log confirm-danger ## This will destroy a service (DANGER)
	@echo "WARNING: THIS WILL DESTROY ALL DATA FOR THE SERVICE" && \
	echo "️🧨 Enter the name of the service you wish to destroy: " && \
		read service_destroy && \
		echo "🧨 Destroying service: $${service_destroy}" && \
		ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml --extra-vars="service_name=$${service_destroy}" ansible/service-destroy.yml

service-destroy-all: log confirm-danger ## This will destroy all services (DANGER)
	@echo "WARNING: THIS WILL DESTROY ALL DATA FOR ALL SERVICES" && \
		ENVIRONMENT=$(ENVIRONMENT) ansible-playbook -i ansible/inventory/$(ENVIRONMENT)/hosts.yml ansible/service-destroy-all.yml
