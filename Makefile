
run:
	(source .venv/bin/activate && ENABLED_GIT_PLUGINS=false mkdocs serve)

file_check:
	python scripts/file_check.py --verbose