FROM gcc:10.2
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
ENV DIR_BUILD=./built

RUN g++ hello.cpp -o ${DIR_BUILD}/hello
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["./built/hello"]