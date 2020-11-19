FROM nginx

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

COPY ./sources.list /etc/apt/sources.list

RUN apt update
RUN apt install -y inetutils-ping
RUN apt install -y nano
RUN apt-get clean

RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list
