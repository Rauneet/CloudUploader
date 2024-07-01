#!/bin/bash
#revision=0.1
#date=Mon Jul  1 11:15:47 IST 2024

PROMETHEUS_VERSION="2.27.1"
TAR_FILE="prometheus-${PROMETHEUS_VERSION}.linux.amd64.tar.gz"
PROMETHEUS_URL="https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/${PROMETHEUS_TAR}"
DOWNLOAD_DIR="/tmp"
TARGET_PATH=${DOWNLOAD_DIR}/${TAR_FILE}

if [ -f "${TARGET_PATH}" ]; then
    echo "Prometheus tar file already exist at ${TARGET_PATH}".

else
    echo "Prometheus tar file not found. Downloading..."
    wget -O "${TARGET_PATH}" "${PROMETHEUS_URL}"
    if [ "$?" -eq 0]; then 
        echo "Downlaod succesfully.. to "${TARGET_PATH}"."
    else
        echo "Failed to download the tar file...."
        exit 1
    fi
fi





