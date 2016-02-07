FROM alpine
MAINTAINER Leandre Gohy <leandre.gohy@hexeo.be>

RUN mkdir /opt

RUN apk --update upgrade
RUN apk add autoconf automake bash binutils bison file flex g++ gcc git \
            libc-dev libgcc libstdc++ linux-headers make ncurses-dev patch \
            texinfo libusb-dev libusb-compat-dev

COPY builder.sh /opt/builder.sh
ENTRYPOINT [ "/opt/builder.sh" ]
