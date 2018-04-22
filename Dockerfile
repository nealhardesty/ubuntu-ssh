FROM ubuntu:latest

LABEL maintainer "https://github.com/nealhardesty"

ENV USERNAME ubuntu
ENV PASSWORD thePasswordGoesHere

RUN apt update -y \
  && apt install -y openssh-server sudo \
  && rm -rf /var/lib/apt/lists/* /tmp/*

ADD lib/entrypoint.sh /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
