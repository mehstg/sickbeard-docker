Sickbeard app running within Docker container

To run:
docker run -d -p <port>:8081 -v <Config volume path>:/opt/config -v <downloads path>:/opt/downloads -v <TV volume path>:/opt/tv -t sickbeard_alpine