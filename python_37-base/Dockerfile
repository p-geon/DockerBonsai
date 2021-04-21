FROM python:3.7
LABEL maintainer "p-geon"
LABEL version="0.1"
LABEL purpose="python3.7-base"

ENV DEBCONF_NOWARNINGS yes
ENV WORKDIR=/work

COPY ./requirements.txt ./

RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget
RUN pip install -q --upgrade pip
RUN pip install -r requirements.txt -q

RUN pip install lightweight-gan

WORKDIR ${WORKDIR}
CMD ["/bin/bash"]
