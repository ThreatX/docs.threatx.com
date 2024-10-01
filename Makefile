
.PHONY: install
install:  ## Install dependencies
	npm install

.PHONY: build
build:  ## Build the documentation site
	npm run build

.PHONY: build-local
build-local: ## Build the documentation site locally
	npm run build-local


.PHONY: serve
serve:  ## Start a web server to preview the site
	npm run serve

.PHONY: help
help:
	@echo "\n🎯 Targets"
	@echo "----------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	


.DEFAULT_GOAL := help
