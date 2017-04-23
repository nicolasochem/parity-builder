Parity builder
==============

This is a toy script to build [Parity](https://github.com/paritytech/parity)
in a predictable environment.

It spins up an Ubuntu 16.04 vagrant box, which in turn spins up a Docker
container that builds the parity binary. The parity binary is then copied
to the host workspace, and the vagrant box is torn down.

Do not use in production.

Prerequisites
-------------

You need vagrant and virtualbox. The builder has been tested on Fedora 25 with
Virtualbox 5.1.18.

Usage
-----

Run `parity-builder`.

See `parity-builder --help` for a list of options:

```
$ ./parity-builder --help
Usage: ./parity-builder [--help] [--rust-version={stable,beta,nightly} ]
               [--parity-version={stable,beta,master} ]
               [--amazon-s3-bucket=mybucket ]
               [--amazon-s3-key=mykey ]
               [--amazon-s3-secret=mysecret ]
               [--amazon-s3-zone=myzone ]

optional arguments:
 -h, --help                    show this help message and exit
 -r, --rust-version            select rust version from stable, beta or nightly
 -p, --parity-version          select parity version from stable, beta or master
 -b, --amazon-s3-bucket        Amazon S3 bucket to upload the binary to
 -k, --amazon-s3-key           Amazon S3 programmatic access key for upload
 -s, --amazon-s3-secret        Amazon S3 secret token for upload
 -z, --amazon-s3-zone          Amazon S3 zone for upload
```

Amazon S3 upload
----------------

Optionally, you can upload your build artifact to Amazon S3.

You need to:
* create a [programmatic access key](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html)
* create a [S3 bucket](http://docs.aws.amazon.com/AmazonS3/latest/UG/CreatingaBucket.html)
* pass the two values (token and secret keys) to the script, as well as
your AWS zone (such as us-west-2) and your bucket name.

Example:

```
$ ./parity-builder --amazon-s3-bucket=parity-ubuntu-1604-binaries --amazon-s3-zone=us-west-1 --amazon-s3-key=XXXXXXXXXXXXXXXX --amazon-s3-secret=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# <parity build log goes here>
Upload successful. Download Parity build at https://s3-us-west-1.amazonaws.com/parity-ubuntu-1604-binaries/parity-20170422203955
Done.

```
