ARG php_version=define_in_build_script
ARG moodle_tag=define_in_build_script
ARG moodle_version=define_in_build_script
ARG ubuntu_version=define_in_build_script

FROM ubuntu:${ubuntu_version}

ARG DEBIAN_FRONTEND=noninteractive
ARG php_version
ARG moodle_tag
ARG moodle_version

RUN echo "php_version : $php_version"
RUN echo "moodle_version : $moodle_version"
RUN echo "moodle_tag : $moodle_tag"

WORKDIR /home/ubuntu/

ADD install_tools.sh .
ADD install_apache.sh .
ADD install_php.sh .
ADD get_moodle.sh .
ADD set_permissions.sh .

RUN chmod +x *.sh

RUN ./install_tools.sh
RUN ./install_php.sh
RUN ./install_apache.sh
RUN ./get_moodle.sh
RUN ./set_permissions.sh

RUN echo 'max_input_vars = 5000' >> /etc/php/$php_version/apache2/php.ini

EXPOSE 80
CMD apachectl -D FOREGROUND
