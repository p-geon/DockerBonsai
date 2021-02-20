#FROM nvidia/cuda:10.2-runtime-ubuntu18.04
FROM tensorflow/tensorflow:2.3.1-gpu
#ENV version_tf=2.4.0
ENV version_tf=2.3.1

ENV DIR_BUILD=./built
ENV DIR_TF=tensorflow_cpp_gpu
RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget \
  gcc \
  g++

# TensorFlow layer
#USER root
WORKDIR /work
RUN mkdir ${DIR_TF}
RUN wget -q https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-${version_tf}.tar.gz --no-check-certificate
RUN tar -C /usr/local -xzf ./libtensorflow-gpu-linux-x86_64-${version_tf}.tar.gz
RUN rm ./libtensorflow-gpu-linux-x86_64-${version_tf}.tar.gz

ENV LIBRARY_PATH=$LIBRARY_PATH:/usr/local/:/usr/local/cuda-10.1/targets/x86_64-linux/lib/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/:/usr/local/cuda-10.1/targets/x86_64-linux/lib/

ENTRYPOINT ["/bin/bash"]
#COPY ./entrypoint.sh ./
#ENTRYPOINT ["sh", "./entrypoint.sh"]