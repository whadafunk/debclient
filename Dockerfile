FROM debian:latest
MAINTAINER blakota@gmail.com

# We need to set the term environment var in order to avoid some errors with running apt
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive


# Installing the extra stuff
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y procps
RUN apt-get install -y vim
RUN apt-get install -y ssh
RUN apt-get install -y tcpdump
# RUN apt-get install -y ngrep
RUN apt-get install -y nmap
RUN apt-get install -y netcat
# RUN apt-get install -y sudo
# RUN apt-get install -y git
# RUN apt-get install -y gpg
# RUN apt-get install -y mc
# RUN apt-get install -y tmux
RUN apt-get install -y net-tools

# These are some preparative actions which can be moved in a script
RUN useradd -c "admin" -s /bin/bash -d /home/admin -m admin
# Change password for the admin user
# Include user in sudo group
# Setting up the environment a bit

RUN mkdir /run/sshd
RUN mkdir /home/admin/.ssh
RUN mkdir /root/.ssh
RUN chown -R admin.admin /home/admin/
COPY ./ssh_keys /home/admin/.ssh/
COPY ./ssh_keys /root/.ssh
COPY ./scripts /opt
RUN cat /root/.ssh/daniel@lab.pub > /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
COPY ./sshd_config /etc/ssh/
# USER admin
EXPOSE 1234/tcp
EXPOSE 22/tcp
ENTRYPOINT ["/opt/init.sh"]
