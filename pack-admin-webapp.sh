#!/usr/bin/env bash

packageName=admin-webapp.tgz
rm -f ${packageName}

NODE_IMAGE='node:12-alpine' DOCKER_BUILDKIT=1 docker build --no-cache --progress=plain --output ./ .
cp -v ${packageName} ../fabric-starter-rest
