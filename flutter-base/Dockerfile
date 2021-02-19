FROM ubuntu:18.04
LABEL purpose="flutter-base"
LABEL version="alpha-0.1"
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND=noninteractive

# set timezone (tzdataは単体で最初にインストールする必要があった気がする)
ENV TZ="Asia/Tokyo"
RUN apt-get update -y -q
RUN apt-get install -y -q --no-install-recommends \
    tzdata
# apt-get
RUN apt-get install -y -q --no-install-recommends \
    wget \
    vim
# --- ↑ basic layer
# --- ↓ flutter layer
RUN apt-get install -y -q --no-install-recommends\
    git \
    unzip \
    clang \
    xserver-xorg \
    pkg-config \
    libgtk-3-dev \
    curl \
    cmake \
    ninja-build \
    wget \
    gnupg

RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update -y -q
RUN apt-get install google-chrome-stable -y -q

# flutter SDK
RUN git clone https://github.com/flutter/flutter.git

WORKDIR /work
ENTRYPOINT ["/bin/bash"]