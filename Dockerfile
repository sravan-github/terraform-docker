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
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN sudo apt update && sudo apt install terraform
#RUN unzip ./terraform_0.12.2_linux_amd64.zip
#RUN cp -r terraform /usr/local/bin/
# Create ubuntu user with sudo privileges
RUN useradd -ms /bin/bash ubuntu && \
    usermod -aG sudo ubuntu
# New added for disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set as default user
USER ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash","-c","tail -f /dev/null"]
