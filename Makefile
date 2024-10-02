
ruby_version = 3.3.5
rvm_path ?= /etc/profile.d/rvm.sh
playbook ?= ./antora-playbook.yml
ui_path ?= ../threatx-docs-ui

.PHONY: ci-install
ci-install:  ## Setup Ruby and install dependencies
	sudo apt-get update \
		&& sudo apt-get install -y software-properties-common
	sudo apt-add-repository -y ppa:rael-gc/rvm
	sudo apt-get update \
		&& sudo apt-get install -y rvm
	source $(rvm_path)
	rvm install $(ruby_version)
	rvm use $(ruby_version)
	bundle config set path '.bundle/gems'
	bundle 
	npm install
	

.PHONY: install
install:  ## Install dependencies
	npm install
	source $(rvm_path)
	rvm use $(ruby_version)
	bundle config set path path '.bundle/gems'
	bundle


.PHONY: clean
clean:
	rm -rf ./build ./public 


.PHONY: clean-all
clean-all: clean
	rm -rf ./.cache ./.bundle ./node_modules


.PHONY: build-ui
build-ui: ## Build the local UI repository
	cd $(ui_path)
	npm install
	./node_modules/.bin/gulp
	cd -
	

.PHONY: build
build:  ## Build the documentation site
	source $(rvm_path) && rvm use $(ruby_version)
	./node_modules/.bin/antora generate --stacktrace --fetch $(playbook)


.PHONY: serve
serve:  ## Start a web server to preview the site
	npm run serve

.PHONY: help
help:
	@echo "\n🎯 Targets"
	@echo "----------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	


.DEFAULT_GOAL := help
