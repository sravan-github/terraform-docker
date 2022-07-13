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
RUN wget https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_386.zip
RUN uzip terraform_1.2.5_linux_386.zip
RUN mv terraform /usr/local/bin
USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash","-c","tail -f /dev/null"]
