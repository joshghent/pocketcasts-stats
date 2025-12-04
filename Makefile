# Variables
NAME = "pocketcasts-stats"

all: build run

build:
	docker build -t $(NAME) .

run:
	docker run --env-file=.env $(NAME)

test:
	uv run pytest

test-docker: build
	docker run -ti --env-file=.env $(NAME) uv run pytest

coverage:
	uv run pytest --cov=./

coverage-docker: build
	docker run -ti --env-file=.env $(NAME) uv run pytest --cov=./

report:
	uv run pytest --cov-report=xml:cov.xml --cov=./

sync:
	uv sync

lock:
	uv lock

.PHONY: all build run test test-docker coverage coverage-docker report sync lock
