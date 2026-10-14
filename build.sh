#!/bin/sh

image_name=creativeprojects/php-ci
image_versions="8.2 8.4"

cd "$(dirname "${0}")" || exit

for image_version in ${image_versions}; do
    echo "Building image ${image_name}:${image_version}"
    docker buildx build \
        --pull \
        --file "php${image_version}.Dockerfile" \
        --platform linux/amd64,linux/arm64 \
        --tag "${image_name}:${image_version}" \
        --tag "${image_name}:latest" \
        --push \
        .
done
