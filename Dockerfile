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

RUN if [ ! -f /tmp/foo.txt ]; then
        echo "Generating ssh keys"
        ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
    fi

    echo "starting tmate"
    tmate -S /tmp/tmate.sock new-session -d
    tmate -S /tmp/tmate.sock wait tmate-ready
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' 
    echo "started, sleeping"

    sleep infinity
