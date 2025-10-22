.PHONY: setup run test docker-build docker-run kind-up k8s-apply

setup:
	python -m venv .venv && . .venv/bin/activate && pip install -U pip && pip install -r app/requirements.txt -r tests/requirements.txt

run:
	. .venv/bin/activate && uvicorn app.main:app --reload --port 8000

test:
	. .venv/bin/activate && pytest -q

docker-build:
	docker build -t devops-starter:local .

docker-run:
	docker run -p 8000:8000 devops-starter:local

kind-up:
	kind create cluster --name devops-starter || true

k8s-apply:
	kubectl apply -f k8s/
