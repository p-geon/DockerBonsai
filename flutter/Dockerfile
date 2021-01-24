#FROM cirrusci/flutter
FROM ubuntu:18.04
LABEL maintainer "p-geon"
LABEL version="0.1"
LABEL purpose="flutter-base"

RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget \
  clang \
  curl \
  pkg-config \
  ninja-build \
  cmake \
  libgtk-3-dev \
  libblkid-dev \
  liblzma-dev \
  git

RUN git clone -b master https://github.com/flutter/flutter.git
RUN ./flutter/bin/flutter --version

RUN which flutter
RUN flutter doctor

WORKDIR /work
ENTRYPOINT ["/bin/bash"]