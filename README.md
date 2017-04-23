Parity builder
==============

This is a toy script to build [parity](https://github.com/paritylabs/parity)
in a predictable environment.

It spins up an Ubuntu 16.04 vagrant box, which in turn spins up a Docker
container that builds parity.

Do not use in production.

Prerequisites
-------------

You need vagrant and virtualbox. This has been tested on Fedora 25 with
Virtualbox.

Usage
-----

Run `parity-builder`.

See `parity-builder --help` for a list of options.
