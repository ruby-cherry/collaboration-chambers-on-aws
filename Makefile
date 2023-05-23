
.PHONY: help local-docs test clean

help:
	@echo "Usage: make [ help | local-docs | github-docs | clean ]"

.mkdocs_venv/bin/activate:
	rm -rf .mkdocs_venv
	python3 -m venv .mkdocs_venv
	source .mkdocs_venv/bin/activate; pip install mkdocs pygments pymdown-extensions mkdocs-material  mkdocs-material-extensions

local-docs: .mkdocs_venv/bin/activate
	source .mkdocs_venv/bin/activate; mkdocs serve&
	firefox http://127.0.0.1:8000/

github-docs: .mkdocs_venv/bin/activate
	source .mkdocs_venv/bin/activate; mkdocs gh-deploy --strict

clean:
	git clean -d -f -x
	# -d: Recurse into directories
