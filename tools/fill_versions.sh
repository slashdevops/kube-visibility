#!/bin/bash
set -x

UPSTREAM_PATH="pkg/upstream"

# get:
# $1 Kubernetes manifest
# $3 Docker image
# $4 Docker image version
# Note:
# 1. prometheus and alertmanager are deployed using prometheus-operator, so the image version pattern is different
get_images_versions()
{
    local retval=""
    grep -R  "image: " $UPSTREAM_PATH | awk -F":" '{print $1 " " $3 " " $4}' | while read MANIFEST IMAGE VERSION
    do
        # Find version for prometheus and alertmanager
        if [[ "$IMAGE" =~ (alertmanager|prometheus)$ ]]; then
            VERSION=$(grep "version: " $MANIFEST | awk -F" " '{print $2}')
        fi
        retval=$( echo "| $IMAGE | $VERSION | $MANIFEST |")
    done
    echo $retval
}
CONTENT="| Image | Version | Manifest |\n"
CONTENT+="| ----- | ------- | -------- |\n"

for line in $(get_images_versions)
do
    echo $line
done