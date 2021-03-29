FROM httpd:latest

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install git wget -y

COPY NoGhost.pk3 /var/www/html/assets/NoGhost/pak100.pk3

WORKDIR /

RUN git clone https://github.com/digidigital/quakejs-installer.git

WORKDIR /quakejs-installer

RUN sed -i "s/127.0.0.1:8080/locustv2.com:8080/g" installerconfig.cfg
RUN sed -i "s/127.0.0.1/locustv2.com/g" installerconfig.cfg

RUN yes | sh installer.sh

RUN echo '<Directory /var/www/html>\nHeader set Access-Control-Allow-Origin "*"\n</Directory>' >> /etc/apache2/sites-enabled/000-default.conf

WORKDIR /home/quake/quakejs
COPY **/*.cfg ./base/NoGhost/

CMD service apache2 start && node build/ioq3ded.js +set net_port 27960 +set fs_game NoGhost +set fs_cdn 'locustv2.com:8080' +set dedicated 2 +exec server.cfg
