FROM httpd:latest

ARG HOSTNAME=localhost
ARG WEB_PORT=80
ARG GAME_PORT=27960
ARG DEDICATED=1
ARG CONFIG=server.cfg

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install git wget -y

COPY NoGhost.pk3 /var/www/html/assets/NoGhost/pak100.pk3

WORKDIR /

RUN git clone https://github.com/digidigital/quakejs-installer.git

WORKDIR /quakejs-installer

RUN sed -i "s/127.0.0.1/${HOSTNAME}/g" installerconfig.cfg

RUN yes | sh installer.sh

RUN echo '<Directory /var/www/html>\nHeader set Access-Control-Allow-Origin "*"\n</Directory>' >> /etc/apache2/sites-enabled/000-default.conf

WORKDIR /home/quake/quakejs
COPY **/*.cfg ./base/NoGhost/

ENV _HOSTNAME=${HOSTNAME}
ENV _GAME_PORT=${GAME_PORT}
ENV _SERVER=${HOSTNAME}:${WEB_PORT}
ENV _DEDICATED=${DEDICATED}
ENV _CONFIG=${CONFIG}

CMD service apache2 start && node build/ioq3ded.js +set net_port ${_GAME_PORT} +set fs_game NoGhost +set fs_cdn ${_SERVER} +set dedicated ${_DEDICATED} +exec ${_CONFIG}
