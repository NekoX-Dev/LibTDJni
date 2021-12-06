# libtdjni

### Dependencies

#### Debian

```shell
sudo apt-get update
sudo apt-get install -y git make zlib1g-dev libssl-dev gperf cmake ninja default-jdk clang libc++-dev libc++abi-dev
```

#### Arch

```shell
sudo pacman -Syu
sudo pacman -S --noconfirm git make clang cmake libc++ openssl zlib gperf ninja jdk11-openjdk
```

### Build and install

```sudo ./install.sh```