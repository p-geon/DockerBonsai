## ENVs
# basic
export PWD=`pwd`
# --------------------------------------------------------
# docker
export DIR_CONTAINER=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`
export NAME_CONTAINER=hyperpigeon/$(DIR_CONTAINER)
export DIR_DOCKER=.
export DOCKERFILE_NAME=Dockerfile
export EXPOSED_PORT=8888
br: ## build & run
	@make b
	@make r
b: ## build docker.
	docker build -f $(DIR_DOCKER)/$(DOCKERFILE_NAME) -t $(NAME_CONTAINER) .
r: ## run docker.
	docker run -it --rm --gpus all \
	-p $(EXPOSED_PORT):$(EXPOSED_PORT) \
	-v $(PWD):/work \
	$(NAME_CONTAINER)
c: ## connect newest container
	docker exec -i -t $(CONTAINER_ID) /bin/bash
# --------------------------------------------------------
# docker commands
export NONE_DOCKER_IMAGES=`docker images -f dangling=true -q`
export STOPPED_DOCKER_CONTAINERS=`docker ps -a -q`
clean: ## clean images/containers
	-@make clean-images
	-@make clean-containers
clean-images:
	docker rmi $(NONE_DOCKER_IMAGES) -f
clean-containers:
	docker rm -f $(STOPPED_DOCKER_CONTAINERS) \
# --------------------------------------------------------
jn:  ## launch jupyter notebook
	jupyter notebook --port $(EXPOSED_PORT) --ip="0.0.0.0" --allow-root
tensorflow-GPU-test:	## check tensorflow-GPU
	python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# --------------------------------------------------------
# help
help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'