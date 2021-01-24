export TARGET=flutterenv
#export TARGET=python37env
export USER_NAME=`whoami`

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
# origin environment creation
.PHONY: install-nvidia-driver
install-nvidia-driver: ## install nvidia-driver
	@sudo apt -y install nvidia-driver-418
	@echo "please reboot yourself"
.PHONY: install-docker

define def_install_docker
	echo "[install docker]"
	sudo apt-get update && apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"
	sudo apt-get update && apt-get install -y \
		docker-ce\
		docker-ce-cli\
		containerd.io
endef

define def_install_nvidia_docker
	echo "[install nvidia docker]"
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
	curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
	curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
	sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
	sudo systemctl restart docker
endef

.PHONY: install-docker
install-docker: ## install docker
	@$(def_install_docker)
	@cat /etc/group | grep docker
	@sudo usermod -aG docker $(USER_NAME)
	@docker -v
	@docker run hello-world
	@$(def_install_nvidia-docker)
	@echo "finished."
# --------------------------------------------------------
.PHONY:	jn
jn:	## Launch jupyter notebook
	jupyter notebook --port 8888 --ip="0.0.0.0" --allow-root

# help
.PHONY:	help
help:	## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'