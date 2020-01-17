include .env

NAME = learning-bash-script

.PHONY: fmt
fmt:
	@printf "\n"
	$(SCRIPT_PATH)/fmt-shell.sh
	@printf "\n"

	@printf "\n"
	$(SCRIPT_PATH)/fmt-markdown.sh
	@printf "\n"

.PHONY: lint
lint:
	@printf "\n"
	$(SCRIPT_PATH)/lint-shell.sh
	@printf "\n"

.PHONY: git-add
git-add: fmt lint
	@printf "\n"
	git add .
	@printf "\n"

.PHONY: clean
clean:
	rm -rf /tmp/$(NAME)
