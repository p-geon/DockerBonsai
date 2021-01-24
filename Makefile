export TARGET=flutter
#export TARGET=python37

# basic-Command
export PWD=`pwd`
export DOCKER_BUILD=docker build
export DOCKER_RUN=docker run

# Experiment
export CONTAINER_NAME=$(TARGET)
export DIR_DOCKER=$(TARGET)
export DOCKERFILE_NAME=Dockerfile
#export EXPOSED_PORT=8888

# --------------------------------------------------------
# build / run

.PHONY:	b
b:	## Build docker.
	$(DOCKER_BUILD) -f $(DIR_DOCKER)/$(DOCKERFILE_NAME) -t $(CONTAINER_NAME) .
.PHONY:	r
r:	## Run docker. without GPUs
	$(DOCKER_RUN) -it --rm \
	-v $(PWD)/$(TARGET):/work/ \
	$(CONTAINER_NAME)
# docker support 
.PHONY: w # build & run (simultaneously)
br:
	@make b
	@make r
.PHONY: c
c: ## re-Connect suspended container
	docker exec -i -t $(CONTAINER_ID) /bin/bash
	
.PHONY:	build
build:	## Build docker without cache.
	$(DOCKER_BUILD) -f $(DIR_DOCKER)/$(DOCKERFILE_NAME) -t $(CONTAINER_NAME) . --no-cache
# --------------------------------------------------------
# Clear all docker images and docker processes
export DOCKER_DELETE_IMAGES=docker rmi
export DOCKER_DELETE_CONTAINERS=docker rm
export NONE_DOCKER_IMAGES=`docker images -f dangling=true -q`
export STOPPED_DOCKER_CONTAINERS=`docker ps -a -q`

.PHONY:	clean
clean:
	@- $(DOCKER_DELETE_IMAGES) $(NONE_DOCKER_IMAGES) -f
	@- $(DOCKER_DELETE_CONTAINERS) -f $(STOPPED_DOCKER_CONTAINERS)
	@echo cleaned
	@docker images
	@docker ps -a
# --------------------------------------------------------
.PHONY:	jn
jn:	## Launch jupyter notebook
	jupyter notebook --port 8888 --ip="0.0.0.0" --allow-root

# --------------------------------------------------------
# help
.PHONY:	help
help:	## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'