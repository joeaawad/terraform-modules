# global settings:
PARALLEL_OPS=50
.DEFAULT_GOAL:=help

define HELP_INSTRUCTIONS
Usage:
	make \033[36m<action>\033[0m  to run action

Actions:
endef
export HELP_INSTRUCTIONS

fmt: ## Format terraform
	@terraform fmt -recursive

fmt-check: ## Check terraform formatting
	@terraform fmt -recursive -check $(args)

help: ## Display this help
	@echo "$$HELP_INSTRUCTIONS"
	@awk 'BEGIN {FS = ":.*##"} /^[a-z-]+:.*?##/ { printf "\t\033[36m%-13s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

init: ## Initialize terraform
	@cd ./examples && rm -rf ./.terraform && terraform init -upgrade

plan: fmt refresh ## Plan terraform
	@cd ./examples && terraform plan -refresh=false $(args)

refresh:
	@cd ./examples && terraform refresh -parallelism=$(PARALLEL_OPS) $(args) 2>&1 > /dev/null
