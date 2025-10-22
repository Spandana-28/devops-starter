# DevOps Starter — FastAPI + Docker + GitHub Actions (+ Terraform & K8s)

A minimal, production-style template you can push to GitHub and extend.

## What’s inside
- **FastAPI** sample app (`/app`) with tests
- **Dockerfile** + `docker-compose.yml`
- **GitHub Actions CI**: lint, test, build Docker
- **Kubernetes** manifests (Deployment + Service)
- **Terraform** sample (S3 bucket) to demo IaC
- **Makefile** for common commands

---

## Quickstart

```bash
# 1) Run locally
make setup run

# 2) Run tests
make test

# 3) Build & run with Docker
make docker-build
make docker-run

# 4) Kind (optional): create a local K8s cluster and deploy
make kind-up
make k8s-apply

# 5) Terraform (optional): provision an S3 bucket
cd terraform
terraform init
terraform apply -auto-approve -var='bucket_prefix=devops-starter'
```

## CI with GitHub Actions
- On every push/PR: Python lint + tests, build Docker image.
- If you set secrets `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN`, the workflow will **login and push** your image.

## Repo layout
```
app/                # FastAPI app
tests/              # Pytest tests
.github/workflows/  # CI pipeline
k8s/                # Kubernetes manifests
terraform/          # Terraform IaC example (AWS S3)
```

## Secrets needed (optional)
- `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN` for Docker push
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION` for Terraform

## Notes
- The Terraform example uses `random_id` to reduce bucket name collisions.
- The K8s manifests are basic and meant for learning or local clusters (kind/minikube).
```
