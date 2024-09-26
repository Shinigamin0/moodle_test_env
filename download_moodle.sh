#!/bin/bash

echo "Version de moodle a descargar : $moodle_version"
echo "tag de moodle a descargar : $moodle_tag"

moodle_direct_link="https://download.moodle.org/download.php/direct/stable"$moodle_version"/moodle-latest-"$moodle_version".tgz"
moodle_md5_link="https://download.moodle.org/stable"$moodle_version"/moodle-latest-"$moodle_version".tgz.md5"

if [ "$1" == "file" ];
then
    wget $moodle_direct_link -O moodle.tgz
    wget $moodle_md5_link -O moodle_md5.txt
    md5SumDownloadedFile=$(md5sum moodle.tgz | awk '{print $1}')
    md5Downloaded=$(cat moodle_md5.txt | awk '{print $2}')

    if [ "$md5SumDownloadedFile" == "$md5SumDownloadedFile" ];
    then
        echo "Sumas MD5 concuerdan"
        tar -xvf moodle.tgz
        rm -f moodle.tgz moodle_md5.txt
        if [ -d ./html ];
        then
            mv ./html ./html_old
        fi

        if [ -d ./moodle ] && [ ! -d ./html ] ;
        then
            mv ./moodle ./html
        else
            echo "Problemas con los directorios, valide si la descompresión fue exitosa,"
            echo "y que el directorio destino no existe."
        fi
    else
        echo "Fallo comprobación de sumas MD5"
    fi
elif [ "$1" == "git" ];
then
    git clone git://git.moodle.org/moodle.git
    cd moodle
    git branch -a
    git branch --track $moodle_tag origin/$moodle_tag
    git checkout $moodle_tag
else
    echo "use file to download, git to get git version"
fi
