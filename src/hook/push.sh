#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;

# * Push docker images
IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"
IMAGE_LATEST="${IMAGE_LATEST:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:latest}"

docker image tag "${IMAGE}" "${IMAGE}"
docker image tag "${IMAGE}" "${IMAGE_LATEST}"
docker image push "${IMAGE}"
docker image push "${IMAGE_LATEST}"
