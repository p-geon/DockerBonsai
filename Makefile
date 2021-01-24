# basic-Command
export PWD=`pwd`
export DOCKER_BUILD=docker build
export DOCKER_RUN=docker run

# Experiment
export CONTAINER_NAME=name_of_the_container
export DIR_DOCKER=docker
export DOCKERFILE_NAME=Dockerfile.py37-base
#export EXPOSED_PORT=8888

# --------------------------------------------------------
# build / run
.PHONY:	b
b:	## Build docker.
	$(DOCKER_BUILD) -f $(DIR_DOCKER)/$(DOCKERFILE_NAME) -t $(CONTAINER_NAME) .
.PHONY:	r
r:	## Run docker. without GPUs
	$(DOCKER_RUN) -it --rm \
	-v $(PWD):/work \
	$(CONTAINER_NAME)
# docker support 
.PHONY: w # build & run (simultaneously)
w:
	@make b
	@make r
.PHONY: c
c: ## re-Connect suspended container
	docker exec -i -t $(CONTAINER_ID) /bin/bash
# --------------------------------------------------------
.PHONY:	jn
jn:	## Launch jupyter notebook
	jupyter notebook --port 8888 --ip="0.0.0.0" --allow-root

# --------------------------------------------------------
# help
.PHONY:	help
help:	## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'