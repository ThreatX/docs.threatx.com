

antora_image ?= antora/antora:3.1.7
url ?= https://docs.threatx.com

playbook ?= antora-playbook.yml
output_dir ?= public

antora ?= node_modules/.bin/antora

.PHONY: install
install:  ## Install dependencies
	npm install


.PHONY: build
build:  ## Build the documentation site
	@echo "⌛ Building Antora playbook ..."
	$(antora) \
		--fetch \
		--to-dir $(output_dir) \
		--url $(url) \
		$(playbook)
	@echo "✅ Documentation site built successfully."
	@echo "📁 Output directory: $(output_dir)"


.PHONY: serve
serve:  ## Start a web server to preview the site
	npx http-server $(output_dir)


.PHONY: help
help:
	@echo "\n🎯 Targets"
	@echo "----------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	


.DEFAULT_GOAL := help
