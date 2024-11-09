
playbook ?= ./antora-playbook.yml
authormode_playbook ?= ./antora-playbook.devel.yml

.PHONY: clean
clean:
	rm -rf ./build ./public ./.cache ./.bundle ./node_modules


.PHONY: build
build:  ## Build the documentation site
	npx antora generate --stacktrace --fetch $(playbook)

.PHONY: build-local
build-local:  ## Build the documentation site
	npx antora generate --stacktrace --fetch $(authormode_playbook)


.PHONY: serve
serve:  ## Start a web server to preview the site
	npm run serve

.PHONY: help
help:
	@echo "\n🎯 Targets"
	@echo "----------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	


.DEFAULT_GOAL := help
