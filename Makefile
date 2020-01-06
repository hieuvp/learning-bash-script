include .env

.PHONY: fmt
fmt:
	$(SCRIPT_PATH)/fmt-shell.sh
	$(SCRIPT_PATH)/fmt-markdown.sh

.PHONY: lint
lint:
	$(SCRIPT_PATH)/lint-shell.sh

.PHONY: git-add
git-add: fmt lint
	git add .
