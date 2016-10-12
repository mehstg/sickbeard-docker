FROM alpine:latest
MAINTAINER Paul Braham
# Installing temporary build packages 
RUN apk add --no-cache --virtual .build-deps curl gcc g++ python-dev openssl-dev  && \
# Install packages
apk add --no-cache python git && \
# Installing python dependencies 
curl https://bootstrap.pypa.io/get-pip.py > /root/pip.py && \
python /root/pip.py && \
pip install cheetah && \
# Install sickbeard
git clone https://github.com/midgetspy/Sick-Beard.git /opt/sickbeard --depth 1 && \
# Removing all software installed in order to compile par2 
apk del .build-deps && \
# Removing all download and package cache 
rm -rf /var/cache/apk/* && \
rm /root/pip.py

EXPOSE 8081

VOLUME ["/opt/config","/opt/downloads","/opt/tv"]

ENTRYPOINT python /opt/sickbeard/SickBeard.py  --datadir=${SB_DATA-/opt/config}
