#!/bin/bash
set -a

RUNNER=podman
if ! type $RUNNER >/dev/null 2>&1
then
    echo "Using docker, eww you should install podman"
    RUNNER=docker
fi

CONTAINER_URL=${CONTAINER_URL:-docker.io/redhatinsights/insights-proxy}
case "`uname -s`" in
    Linux*)
        LINUX=true
        PLATFORM=linux;;
    Darwin*)
        DARWIN=true
        PLATFORM=darwin;;
    *)
        echo 'This only works on Linux or Darwin!'
        exit 1;;
esac
