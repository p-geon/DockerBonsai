export DIR_CONTAINER=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`
export NAME_CONTAINER=hyperpigeon/$(DIR_CONTAINER)
export PWD=`pwd`
# ====================
br:
	@make b
	@make r
b: ## build notebook & lab 
	docker build -f ./Dockerfile -t $(NAME_CONTAINER) .
r: ## run jupyter notebook
	docker run -it --rm -v $(PWD):/work/ $(NAME_CONTAINER)