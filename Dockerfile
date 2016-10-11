FROM centos:latest
MAINTAINER Paul Braham
RUN yum update -y && \
yum install git python-pip gcc gcc-c++ python-devel libffi-devel openssl-devel par2cmdline wget -y && \
mkdir /opt/sickbeard && \
git clone https://github.com/midgetspy/Sick-Beard.git /opt/sickbeard --depth 1 && \
yum install epel-release -y && \
yum install python-pip gcc gcc-c++ python-devel openssl-devel -y && \
pip install --upgrade pip && \
pip install Cheetah

EXPOSE 5050

VOLUME ["/opt/config","/opt/downloads","/opt/scripts"]

ENTRYPOINT python /opt/sickbeard/SickBeard.py
