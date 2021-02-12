.PHONY: b
b: ## build notebook & lab 
	@docker build -f Dockerfile.notebook -t jupyter_notebook .
	@docker build -f Dockerfile.lab -t jupyter_lab .
.PHONY: r
r: ## run jupyter notebook
	make notebook
# 
.PHONY: notebook
notebook: ## run jupyter notebook
	docker run -it --rm -v ~/:/work/ -p 8888:8888 jupyter_notebook
.PHONY: lab
lab: ## run jupyter lab
	docker run -it --rm -v ~/:/work/ -p 8888:8888 jupyter_lab

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
