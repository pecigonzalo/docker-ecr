#!/bin/bash

set -e

if [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
  docker tag $REPO:$TRAVIS_COMMIT $REPO:$TAG
  docker tag $REPO:$TRAVIS_COMMIT $REPO:$VERSION
  docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
  docker push $REPO:$TAG
  docker push $REPO:$VERSION
fi
