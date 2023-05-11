#!/usr/bin/env bash
set -eux

PACKAGE_PATH=${1}
PACKAGE_FULLNAME="$(grep Package: "$PACKAGE_PATH"/DEBIAN/control | cut -f2 -d ' ')"_"$(grep Version: "$PACKAGE_PATH"/DEBIAN/control | cut -f2 -d ' ')"_"$(grep Architecture: "$PACKAGE_PATH"/DEBIAN/control | cut -f2 -d ' ')"

dpkg-deb -b ${PACKAGE_PATH} ${PACKAGE_FULLNAME}

