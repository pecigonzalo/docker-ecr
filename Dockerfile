FROM docker:latest
MAINTAINER Gonzalo Peci <pecigonzalo@outlook.com>

ADD ./bin/local/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
ADD ./config.json /root/.docker/config.json
