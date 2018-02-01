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

# install GNU R
RUN apt-key adv \
       --keyserver keyserver.ubuntu.com \
       --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 &&\
    add-apt-repository \
       'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' &&\
    apt update &&\
    apt install --yes r-base

VOLUME /data

WORKDIR /data