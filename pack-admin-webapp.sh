#!/usr/bin/env bash

PACKAGE_NAME=${PACKAGE_NAME:-admin-webapp.tgz}
rm -f ${packageName}

DOCKER_BUILDKIT=1 \
docker build \
--build-arg NODE_IMAGE=${NODE_IMAGE:-node:12-alpine} \
--build-arg PACKAGE_NAME=${PACKAGE_NAME} \
--no-cache --progress=plain --output ./ .

cp -v ${PACKAGE_NAME} ../fabric-starter-rest
