#!/bin/bash
# shellcheck disable=SC1091
set -a; source ../VERSIONS ; set +a;

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"
DOCKERFILE="${DOCKERFILE:-Dockerfile}"

docker build \
       --no-cache \
       --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
       --build-arg NS_IMAGE_REPOSITORY="${NS_IMAGE_REPOSITORY}" \
       --build-arg NS_IMAGE_NAME="${NS_IMAGE_NAME}" \
       --build-arg NS_IMAGE_TAG="${NS_IMAGE_TAG}" \
       --build-arg OACS_TAG="${OACS_TAG}" \
       -t "${IMAGE}" \
       -f ../"${DOCKERFILE}" \
       ../.
