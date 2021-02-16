# tf2.3+py3.69
FROM tensorflow/tensorflow:latest-gpu
LABEL maintainer "p-geon"
LABEL version="0.3.0"
LABEL purpose="GeneralPurpose"

## ==Hide Warnings==
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND=noninteractive

## ==apt==
# alphabet-based sorting
# set timezone
ENV TZ="Asia/Tokyo"
RUN apt-get update && apt-get install -y tzdata
RUN apt-get install -y --quiet --no-install-recommends \
  graphviz \
  vim \
  wget

# == python modules==
RUN pip install -q --upgrade pip
COPY requirements.txt ./
RUN pip install -r requirements.txt -q

RUN pip install -q -U\
	tf-hub-nightly==0.10.0.dev202012010006\
	tensorflow-addons==0.11.2

# ==Add user==
USER root

# ==finish building==
EXPOSE 8888
WORKDIR /work
ENTRYPOINT ["/bin/bash"]