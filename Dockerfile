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
    python-software-properties \
    gnupg2 \
    apt-transport-https

# install GNU R
RUN gpg \
       --keyserver hkp://keyserver.ubuntu.com:80 \
       --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 &&\
    gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | apt-key add - &&\
    add-apt-repository \
       'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' &&\
    apt update &&\
    apt install --yes \
       r-base \
       libcurl4-openssl-dev \
       libssl-dev \
       libxml2-dev \
       libmariadb-client-lgpl-dev

VOLUME /data

WORKDIR /data