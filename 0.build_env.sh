#!/bin/bash
source ./conf

echo "Construyendo imagen..."
echo "php version : $php_version"
echo "moodle version : $moodle_version"
echo "moodle tag : $moodle_tag"

docker build --no-cache\
    --build-arg ubuntu_version=$ubuntu_version \
    --build-arg moodle_version=$moodle_version \
    --build-arg moodle_tag=$moodle_tag \
    --build-arg php_version=$php_version \
    -t $moodle_image_name ./image/.

echo "Creando red..."

docker network create $moodle_docker_network

echo "Creando volumenes..."

if [ ! -d ./db ] || [ ! -d ./data ] || [ ! -d ./app ];
then
    mkdir db data
fi
