#!/usr/bin/env bash
set -eu

BOYAKI_DIRECTORY=/workspaces/boyaki
ARCHIVE_NAME=boyaki.zip
TARGET=${MOUNTED_HOST_DIR_PATH_IN_CONTAINER}/boyaki


if [ -f "${TARGET}/${ARCHIVE_NAME}" ]; then
    echo "We can't override the existing \"${MOUNTED_HOST_DIR}/boyaki/${ARCHIVE_NAME}\" file on your host machine!" 1>&2
    echo "Remove the file first and re-run again :)" 1>&2
    exit 2
fi

echo "Creating an arhive file from \"${BOYAKI_DIRECTORY}\" inside container..."
cd ${BOYAKI_DIRECTORY}/
ZIP_FILE="/tmp/${ARCHIVE_NAME}"
rm -f ${ZIP_FILE} && zip -qr ${ZIP_FILE} ./

echo "Copying the archive file to \"${MOUNTED_HOST_DIR}/boyaki/${ARCHIVE_NAME}\"..."
mkdir -p ${TARGET}
cp ${ZIP_FILE} ${TARGET}/${ARCHIVE_NAME}

echo "Done! Yay!"
