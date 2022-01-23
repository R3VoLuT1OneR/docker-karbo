# Docker-Karbo
[Karbo](https://karbo.io) it is anonymous cryptocurrency.
Karbo uses peer-to-peer network to synchronize decentralized ledger between it's nodes.
Each node has a copy of all ever done transactions in the network.

This Docker image include last version program to run Karbo node `karbowanecd`.

As well image includes utility and CLI wallet tools like: `walletd`, `simplewallet`, `greenwallet`, `optimizer`.

### Usage
To run the latest version of karbo node simple as:
```shell
$ docker run r3volut1oner/karbo
```

As node must run on latest software version, it is recommended default `latest` tag that will be always updated.

### Development
After version update we must manually build and push the image to the [docker hub](https://hub.docker.com/).

```shell
./build_new_version.sh 2.5.1
```

### License
Configuration files and code in this repository are distributed under the [MIT license](/LICENSE).
