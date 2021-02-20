export DIR_CONTAINER=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`
export NAME_CONTAINER=hyperpigeon/$(DIR_CONTAINER)
# ========================================
b: ## build Docker
	-@make build-cpp
	-@make build-py
py: ## build & run python
	@make build-py
	@make run-py
cpp: ## build & run c++
	@make build-cpp
	@make run-cpp
-: ## ========================================
build-py: ## build python only
	docker build -f Docker/Dockerfile.py  -t $(NAME_CONTAINER)_py .
build-cpp: ## build c++ only
	#docker build -f Docker/Dockerfile.cpp -t $(NAME_CONTAINER)_cpp .
	docker build -f Docker/Dockerfile.cpp -t $(NAME_CONTAINER)_cpp .
-: ## ========================================
run-py: ## run python(train)
	docker run -it --rm \
	--gpus all \
	-v $(PWD):/work/ \
	$(NAME_CONTAINER)_py
run-cpp: ## run c++
	docker run -it --rm \
	--gpus all \
	-v $(PWD):/work/ \
	$(NAME_CONTAINER)_cpp
-: ## ========================================
# help
.PHONY:	help
help:	## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
