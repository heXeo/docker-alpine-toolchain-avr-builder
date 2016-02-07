#!/usr/bin/env bash

set -eo pipefail; [[ "$TRACE" ]] && set -x

main() {
  {
    # Clone sources
    cd /opt
    git clone https://github.com/heXeo/toolchain-avr.git -b alpine

    cd toolchain-avr
    ./tools.bash
    ./clean.bash

    # Build avr-binutils
    ./binutils.build.bash
    tar cvjf avr-binutils-2.24.tar.bz2 -C objdir/ .
    ./clean.bash
    rm -Rf ./objdir
    tar xvjf avr-binutils-2.24.tar.bz2 -C /usr/

    # Build avr-gcc
    ./gcc.build.bash
    tar cvjf avr-gcc-4.8.1.tar.bz2 -C objdir/ .
    ./clean.bash
    rm -Rf ./objdir
    tar xvjf avr-gcc-4.8.1.tar.bz2 -C /usr/

    # Build avr-libc
    ./avr-libc.build.bash
    tar cvjf avr-libc-1.8.0.tar.bz2 -C objdir/ .
    ./clean.bash
    rm -Rf ./objdir

    # Build avrdude
    ./avrdude.build.bash
    tar cvjf avrdude-6.0.1.tar.bz2 -C objdir/ .
    ./clean.bash
    rm -Rf ./objdir
  } >&2
}

main "$@"
