FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
LABEL purpose="pytorch-gpu-notebook"
LABEL version="0.1"

ENV DIR_DOCKER=.
ENV DEBCONF_NOWARNINGS yes

COPY ./requirements/requirements_gp.txt ./
COPY ./requirements/requirements_dl.txt ./
COPY ./requirements/requirements.txt ./

RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
    graphviz \
    wget \
    gcc

RUN pip install -q --upgrade pip
RUN pip install -r requirements_gp.txt -q
RUN pip install -r requirements_dl.txt -q
RUN pip install -r requirements.txt -q

WORKDIR /work
EXPOSE 8888
ENTRYPOINT ["/bin/bash"]
#ENTRYPOINT ["jupyter", "lab", "--port", "8888", "--ip=0.0.0.0", "--allow-root"]