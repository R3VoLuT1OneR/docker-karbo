FROM ubuntu:20.10 AS builder

ARG KARBO_GIT_REPOSITORY="https://github.com/Karbovanets/karbo.git"
ARG KARBO_GIT_TAG="v.2.3.7"

WORKDIR /src

RUN set -x \
    && export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update 1>/dev/stdout \
    && apt-get install -y build-essential git cmake libssl-dev libboost-all-dev 1>/dev/stdout \
    && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && git clone ${KARBO_GIT_REPOSITORY} /src/karbo --branch=${KARBO_GIT_TAG} --depth=1 1>/dev/null \
    && cd /src/karbo && mkdir build && cd build && cmake .. && cd .. && make

FROM ubuntu:20.10

RUN useradd -ms /bin/bash --home-dir /karbo karbo
USER karbo
WORKDIR /karbo

COPY --from=builder \
  /src/karbo/build/release/src/karbowanecd \
  /src/karbo/build/release/src/walletd \
  /src/karbo/build/release/src/simplewallet \
  /src/karbo/build/release/src/greenwallet \
  /src/karbo/build/release/src/optimizer \
  /usr/bin/

CMD /bin/karbowanecd