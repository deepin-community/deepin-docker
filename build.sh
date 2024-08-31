#!/bin/bash

set -e -u -x

CODENAME=$1
ARCH=$2
VERSION=$3

OWNER=linuxdeepin
ROOTFS=deepin-docker-rootfs-${ARCH}.tar.gz
ROOTFS_URL=https://github.com/deepin-community/deepin-rootfs/releases/download/${VERSION}/${ROOTFS}

curl -OLS $ROOTFS_URL

docker buildx build --platform linux/${ARCH} --build-arg ROOTFS=$ROOTFS -t ${OWNER}/deepin:${CODENAME}-${ARCH}-${VERSION} .
