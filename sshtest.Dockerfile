FROM ubuntu:bionic AS build

# Install openssh-server package
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Set the sshd_config file
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create a new user
RUN adduser --disabled-password --gecos '' sshuser && \
    echo "sshuser:testmdp123" | chpasswd

# Copy the authorized_keys file to the container
COPY /access/key_access/docker_save_key.pub /home/sshuser/.ssh/authorized_keys

# Set the permissions for the .ssh directory and the authorized_keys file
RUN chown -R sshuser:sshuser /home/sshuser/.ssh && \
    chmod 700 /home/sshuser/.ssh && \
    chmod 600 /home/sshuser/.ssh/authorized_keys

# Start SSH service and run bash

ENTRYPOINT [ "/etc/init.d/" ]

EXPOSE 22

CMD ["tail", "-f", "/dev/null"]

###Executer /etc/init.d/ssh start  pour activer le service docker inspect -f "{{ .NetworkSettings.IPAddress }}" ssh-ctn
