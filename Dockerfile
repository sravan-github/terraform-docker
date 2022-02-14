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
RUN wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
RUN unzip ./terraform_0.12.2_linux_amd64.zip
RUN cp -r terraform /usr/local/bin/
# Create ubuntu user with sudo privileges
RUN useradd -ms /bin/bash ubuntu && \
    usermod -aG sudo ubuntu
# New added for disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set as default user
USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash","-c","tail -f /dev/null"]
