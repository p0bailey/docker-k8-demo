#Authored by Phillip Bailey
.PHONY: all docker_build
.SILENT:


all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker_build:  ## Build image.
	docker build -t docker-k8-flask:v3 .

docker_run:  ## Run image.
	docker run -p 80:80 -t docker-k8-flask:v3
