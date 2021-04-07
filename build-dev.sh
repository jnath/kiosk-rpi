#!/bin/bash

source  poky/oe-init-build-env  build-rpi
bitbake core-image-base
runqemu qemuarm