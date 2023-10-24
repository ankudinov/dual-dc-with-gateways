CURRENT_DIR := $(shell pwd)

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Generate AVD configs
	cd $(CURRENT_DIR)/dual-dc-l3ls; ansible-playbook build.yml

.PHONY: deploy
deploy: ## Deploy AVD configs using eAPI
	cd $(CURRENT_DIR)/dual-dc-l3ls; ansible-playbook deploy.yml
