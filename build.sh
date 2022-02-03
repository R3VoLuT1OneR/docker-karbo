#!/bin/bash
set -e

if [ "$#" -ne "1" ]
then
  echo "Usage: $0 \$KARBO_VERSION"
  exit 1
fi

KARBO_VERSION=$1

docker build . \
  -t r3volut1oner/karbo:latest \
  -t r3volut1oner/karbo:${KARBO_VERSION} \
  --build-arg KARBO_GIT_TAG=v.${KARBO_VERSION}

docker push r3volut1oner/karbo:${KARBO_VERSION}
docker push r3volut1oner/karbo:latest

echo ""
echo "New docker image pushed: r3volut1oner/karbo:$KARBO_VERSION"