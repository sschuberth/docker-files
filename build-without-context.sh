#!/bin/sh

IMAGE="$1"
FILE="${2:-Dockerfile}"

# Build the image without a context to avoid it being sent to the daemon every time.
docker build -t $IMAGE - < $FILE
