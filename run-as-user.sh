#!/bin/sh

IMAGE="$1"

# Docker command line options required to run as the current user.
RUN_AS_USER="-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v $HOME:$HOME -u $(id -u $USER):$(id -g $USER)"

# Mount the current working directory into the image to run the command from there.
docker run -it $RUN_AS_USER -v /tmp:/tmp -v $PWD:/home/workspace -w /home/workspace $IMAGE /bin/sh
