FROM cirrusci/flutter
LABEL maintainer "p-geon"
LABEL version="0.1"
LABEL purpose="flutter-base"

RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget

RUN which flutter
RUN flutter doctor

WORKDIR /work
ENTRYPOINT ["/bin/bash"]