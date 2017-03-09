#!/bin/bash

set -o pipefail
set -e


# This is not PR, skipping version check
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "This is not PR, skipping version check."
  exit 0
fi

# If this is a PR
function docker_tag_exists() {
    curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
}

if docker_tag_exists "$REPO" "$VERSION"; then
  echo "$VERSION already exists!!" &>2
  exit 1
else
  echo "New version $VERSION detected."
fi
