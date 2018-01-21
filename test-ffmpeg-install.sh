#!/bin/bash

set -e

RELEASES_URL=https://johnvansickle.com/ffmpeg/releases/
RELEASE_TYPE=64bit
RELEASE_VERSION=3.4.1

UNTARRED_NAME="ffmpeg-${RELEASE_VERSION}-${RELEASE_TYPE}-static"
TAR_NAME="ffmpeg-release-${RELEASE_TYPE}-static.tar"
COMPRESSED_TAR_NAME="${TAR_NAME}.xz"

FILE_URL="${RELEASES_URL}${COMPRESSED_TAR_NAME}"
CACHED_DOWNLOAD="${HOME}/cache/${COMPRESSED_TAR_NAME}"

wget --continue --output-document "${CACHED_DOWNLOAD}" "${FILE_URL}"
unxz -k "${CACHED_DOWNLOAD}" || true
tar -xaf "${HOME}/cache/${TAR_NAME}" -C "${HOME}/cache/"

ln -s "${HOME}/cache/${UNTARRED_NAME}/ffmpeg" "${HOME}/bin/"

ffmpeg -L
