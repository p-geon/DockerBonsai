export PWD=`pwd`
export HOME=/home/nagano
export DISP=`echo $(DISPLAY)`

disp:
	echo $(DISP)
b: # build xeyes (testing DISPLAY)
	docker build -t xeyes -f ./Dockerfile.eyes .
r: # run xeyes
	docker run --rm -it \
		--net host \
		-e DISPLAY=$(DISP) \
		-v $(HOME)/.Xauthority:/root/.Xauthority \
		xeyes
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
	docker rm -f $(STOPPED_DOCKER_CONTAINERS)