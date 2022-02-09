FROM ubuntu:14.04
MAINTAINER Mengyang Li <mayli.he@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:nviennot/tmate \
    && apt-get update \
    && apt-get install -y openssh-client tmate\
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x run.sh && run.sh /root/run.sh
