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