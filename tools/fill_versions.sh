#!/bin/sh

UPSTREAM_PATH="pkg/upstream"
MD_FILE="docs/VERSIONS.md"
# get:
# $1 Kubernetes manifest
# $3 Docker image
# $4 Docker image version
# Note:
# 1. prometheus and alertmanager are deployed using prometheus-operator, so the image version pattern is different
CONTENT="# Container image versions\n"
CONTENT+="\n"
CONTENT+="The content of this files is auto-generated using the bash script [fill_versions.sh](../tools/fill_versions.sh)\n"
CONTENT+="\n"
CONTENT+="| Image | Version | Package Manifest |\n"
CONTENT+="| ----- | ------- | ---------------- |"
echo "$CONTENT" > $MD_FILE

grep -R  "image: " $UPSTREAM_PATH | awk -F":" '{print $1 " " $3 " " $4}' | while read MANIFEST IMAGE VERSION
do
    # Find version for prometheus and alertmanager
    if [[ "$IMAGE" =~ (alertmanager|prometheus)$ ]]; then
        VERSION=$(grep "version: " $MANIFEST | awk -F" " '{print $2}')
    fi
    echo "| $IMAGE | $VERSION | $MANIFEST |" >> $MD_FILE
done
