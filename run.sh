#!/usr/bin/env bash
set -eux

ARM_USER="mobile"
ARM_HOST="${2:-"172.17.109.125"}"
ARM_BUNDLEID="${1}"

ssh ${ARM_USER}@${ARM_HOST} "redeb ${ARM_BUNDLEID}" | tee ${ARM_BUNDLEID}.log
ARM_FPATH=$(cat ${ARM_BUNDLEID}.log | grep 'Your new repackaged DEB file is located at ' | cut -d' ' -f9)
scp ${ARM_USER}@${ARM_HOST}:${ARM_FPATH} ./
LOCAL_ARM_FPATH=${ARM_FPATH##*/}

bash repack-rootless.sh ${LOCAL_ARM_FPATH}

ssh ${ARM_USER}@${ARM_HOST} "rm -f ${ARM_FPATH}"
rm -f ${LOCAL_ARM_FPATH}

