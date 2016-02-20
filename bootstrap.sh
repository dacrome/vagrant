#!/usr/bin/env sh

set -e

echo 'deb http://http.debian.net/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
apt-get update -qq
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    unzip vim openjdk-8-jdk tomcat8 postgresql-9.4 git linux-image-amd64

cd /tmp

install/3rdparty.sh
install/build.sh
install/configuration.sh
install/database.sh
install/tomcat.sh
install/docker.sh
install/cleanup.sh
