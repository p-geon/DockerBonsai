FROM gcc:10.2
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
ENV DIR_BUILD=./built
ENV DIR_TF=tensorflow_cpp_gpu

# TensorFlow layer
RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget

USER root
RUN wget -q https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-2.4.0.tar.gz

ENTRYPOINT ["/bin/bash"]