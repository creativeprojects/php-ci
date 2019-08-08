#!/bin/sh

image_name=creativeprojects/php-ci
image_versions="5.6 7.0 7.1 7.2 7.3"

cd $(dirname "${0}")

for image_version in ${image_versions}; do
    echo Downloading php:${image_version}
    docker pull php:${image_version}

    docker rmi ${image_name}:${image_version}
    docker rmi ${image_name}:latest

    echo Building image ${image_name}:${image_version}
    docker build \
        --pull \
        --build-arg http_proxy=${http_proxy} \
        -t ${image_name}:${image_version} \
        -t ${image_name}:latest \
        -f php${image_version}.Dockerfile \
        ./

    echo Pushing image ${image_name}:${image_version}
    docker push ${image_name}:${image_version}

    echo Pushing image ${image_name}:latest
    docker push ${image_name}:latest
done
