#FROM tensorflow/tensorflow
FROM tensorflow/tensorflow:2.3.1
LABEL maintainer "p-geon"
LABEL version="0.1"
LABEL purpose="TensorFlow-CPU-base"

ENV DIR_DOCKER=tf-2.3-cpuenv
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND=noninteractive
ENV WORKDIR=/work

COPY ${DIR_DOCKER}/requirements.txt ./

ENV TZ="Asia/Tokyo"
RUN apt-get update && apt-get install -y tzdata
RUN apt-get install -y --quiet --no-install-recommends \
  vim \
  wget

RUN pip install -q --upgrade pip
RUN pip install -r requirements.txt -q
RUN pip install -q -U\
	tf-hub-nightly==0.10.0.dev202012010006\
	tensorflow-addons==0.11.2

WORKDIR ${WORKDIR}
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["python3", "hello_world.py"]
