#!/bin/bash
source ./conf
docker stop $moodle_app_container_name
docker stop $moodle_db_container_name
docker rm $moodle_app_container_name
docker rm $moodle_db_container_name
docker rmi $moodle_image_name
rm -rf data db 
