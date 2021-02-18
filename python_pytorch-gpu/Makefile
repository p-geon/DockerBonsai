export NAME_CONTAINER=pytorch_gpu_notebook
export EXPOSED_PORT=8888

.PHONY: br
br: ## build & run
	@make b
	@make r
.PHONY: b
b: ## build docker
	docker build -f Dockerfile -t $(NAME_CONTAINER) .
.PHONY: r
r: ## run docker
	docker run -it --rm -v ~/:/work/ -p $(EXPOSED_PORT):$(EXPOSED_PORT) $(NAME_CONTAINER)

# docker commands
export NONE_DOCKER_IMAGES=`docker images -f dangling=true -q`
export STOPPED_DOCKER_CONTAINERS=`docker ps -a -q`

.PHONY: clean
clean: ## clean images&containers
	-@make clean-images
	-@make clean-containers
clean-images:
	docker rmi $(NONE_DOCKER_IMAGES) -f
clean-containers:
	docker rm -f $(STOPPED_DOCKER_CONTAINERS)

# help
.PHONY: help
help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
