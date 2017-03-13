FROM concourse/docker-image-resource
MAINTAINER Gonzalo Peci <pecigonzalo@outlook.com>

ADD https://github.com/docker/compose/releases/download/1.11.2/run.sh /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ADD ./config.json /root/.docker/config.json
