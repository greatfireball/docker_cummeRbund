ARG version=xenial

FROM ubuntu:${version}

LABEL maintainer="frank.foerster@ime.fraunhofer.de"
LABEL description="Dockerfile providing the cummeRbund software"

RUN apt update && apt -y install \
    wget \
    gzip \
    tar \
    build-essential \
    git \
    software-properties-common \
    python-software-properties


VOLUME /data

WORKDIR /data