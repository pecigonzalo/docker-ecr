FROM debian:jessie
MAINTAINER Gonzalo Peci <pecigonzalo@outlook.com>

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
      bash \
      make \
      python-pip
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable"
RUN apt-get update && \
    apt-get install -y -q --no-install-recommends docker-ce
RUN pip install docker-compose

ADD https://raw.githubusercontent.com/concourse/docker-image-resource/master/assets/common.sh /root/common.sh

ADD ./bin/local/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
ADD ./config.json /root/.docker/config.json
