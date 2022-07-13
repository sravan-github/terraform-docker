FROM ubuntu:18.04
RUN apt-get update \
     && apt-get install -y openjdk-11-jdk \
        curl \
        git \
        maven \
        net-tools \
        iputils-ping \
        wget \
        unzip \
        ansible

USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash","-c","tail -f /dev/null"]
