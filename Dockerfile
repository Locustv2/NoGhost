FROM httpd:latest

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install git wget -y

COPY NoGhost.pk3 /var/www/html/assets/NoGhost/pak100.pk3

WORKDIR /

RUN git clone https://github.com/digidigital/quakejs-installer.git

WORKDIR /quakejs-installer

COPY ./maps/*.pk3 customQ3maps/
COPY ./resources/*.pk3 pak100input/
RUN yes | sh installer.sh

RUN echo '<Directory /var/www/html>\nHeader set Access-Control-Allow-Origin "*"\n</Directory>' >> /etc/apache2/sites-enabled/000-default.conf

WORKDIR /home/quake/quakejs
COPY **/*.cfg ./base/NoGhost/

RUN chmod 644 /var/www/html/assets/baseq3/*.pk3

CMD service apache2 start && node build/ioq3ded.js +set net_port 27960 +set fs_game NoGhost +set fs_cdn '127.0.0.1:80' +set dedicated 1 +exec server.cfg
