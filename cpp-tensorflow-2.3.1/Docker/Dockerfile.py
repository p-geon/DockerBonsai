FROM tensorflow/tensorflow:2.3.1-gpu
#ENV version_tf=2.4.0
ENV version_tf=2.3.1
RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
  vim \
  wget

# python
RUN pip install -q --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt -q

WORKDIR /work
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["python", "scripts/train.py"]