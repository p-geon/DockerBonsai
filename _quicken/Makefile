export CONTAINER_NAME=instant_container
export EXPOSED_PORT=9920
export DOCKERFILE=pytorch

build: 
	docker build -f Dockerfile.$(DOCKERFILE) \
		--build-arg EXPOSED_PORT=$(EXPOSED_PORT) \
		-t $(CONTAINER_NAME) .

run:
	docker run -it --rm --gpus all \
		-p 8888:8888 \
		-v $(PWD):/work \
		$(CONTAINER_NAME)
