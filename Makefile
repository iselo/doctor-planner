# Sets default target to handle make execution with no arguments
.DEFAULT_GOAL := help

DOCS_DIR = ./docs/
BASE_HREF = /doctor-planner/

# Requires an explicit option to call the target. E.g. make <target> option=value.
.PHONY: requires.option(%)
requires.option(%):
	@ [ $($%) ] || ( $(MAKE) help; exit 1 )

# Makes Cloud Quark home directory if not exists. Create intermediate directories as required.
$(DOCS_DIR):
	[ -d $@ ] || mkdir -p $@

.PHONY: help
help: ## Prints this help
	@ echo "Automates Flutter build workflow."
	@ echo "Usage: make <target>"
	@ echo "Targets:"
	@ grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: generate
generate: ## Generate code (like Drift, freezed, json_serializable, etc.)
	dart run build_runner build --delete-conflicting-outputs

.PHONY: drift-worker
drift-worker: ## Compiles web/drift_worker.dart
	dart compile js -O4 -o web/drift_worker.dart.js web/drift_worker.dart

.PHONY: local
local: ## Generates localizations
	flutter gen-l10n

.PHONY: web
web: $(DOCS_DIR) ## Builds GH-PAGES
	flutter build web --base-href ${BASE_HREF}
	cp -r build/web/* ${DOCS_DIR}