MAINTAINER blakota@gmail.com
FROM debian:latest
RUN apt-get update
RUN apt-get install -y procps
RUN apt-get install -y vim
RUN apt-get install -y ssh
RUN apt-get install -y tcpdump
RUN apt-get install -y ngrep
RUN apt-get install -y nmap
RUN apt-get install -y netcat
RUN apt-get install -y git
RUN apt-get install -y gpg
RUN apt-get install -y mc
RUN apt-get install -y tmux
RUN apt-get install -y net-tools
COPY ./ssh_keys/* ~/.ssh/
ENTRYPOINT ["/bin/bash"]
