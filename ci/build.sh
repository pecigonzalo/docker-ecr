#!/bin/bash

docker build -t "${REPO:-docker-ecr}:${TRAVIS_COMMIT:-local}" .
