export NAME_CONTAINER=hyperpigeon/python37-base
export PWD=`pwd`

build:
	docker build -f Dockerfile -t $(NAME_CONTAINER) .

run:
	docker run -it --rm --gpus all \
		-v $(PWD):/work \
		$(NAME_CONTAINER) \
  python3 hello_world.py
