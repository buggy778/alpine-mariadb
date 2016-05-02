#!/bin/bash

set -e

export REG_URL=buggy
export IMAGE=alpine-mariadb
export VERSION=latest

docker build -t $REG_URL/$IMAGE .

echo "---> Starting push $REG_URL/$IMAGE:$VERSION"

docker tag $REG_URL/$IMAGE $REG_URL/$IMAGE:$VERSION

#docker push $REG_URL/microimages/$IMAGE
