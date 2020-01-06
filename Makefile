include .env

.PHONY: fmt
fmt:
	@echo "fmt"

.PHONY: lint
lint:
	@echo "lint"

.PHONY: git-add
git-add: fmt lint
	@echo $(SCRIPT_PATH)
	git add .
