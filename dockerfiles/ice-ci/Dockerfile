FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y \
    curl iptables \
    python python-pip \
    python-dev \
    build-essential \
    libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev

# From https://github.com/docker-library/docker/blob/master/1.12/Dockerfile
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.12.2
ENV DOCKER_SHA256 cb30ad9864f37512c50db725c14a22c3f55028949e4f1e4e585a6b3c624c4b0e
RUN set -x && \
  curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz && \
  echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - && \
  tar -xzvf docker.tgz && \
  mv docker/* /usr/local/bin/ && \
  rmdir docker && \
  rm docker.tgz && \
  docker -v
