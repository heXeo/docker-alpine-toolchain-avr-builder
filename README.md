# docker-alpine-toolchain-avr-builder

An AVR toolchain binary package builder in Docker.

## Usage

```
docker run --name toolchain-avr hexeo/alpine-toolchain-avr-builder
docker cp toolchain-avr:/opt/toolchain-avr/avr-binutils-2.24.tar.bz2 .
docker cp toolchain-avr:/opt/toolchain-avr/avr-gcc-4.8.1.tar.bz2 .
docker cp toolchain-avr:/opt/toolchain-avr/avr-libc-1.8.0.tar.bz2 .
docker cp toolchain-avr:/opt/toolchain-avr/avrdude-6.0.1.tar.bz2 .
docker rm toolchain-avr
```
