FROM centos:7
LABEL version="1.0"
LABEL description="This is an apache image"
LABEL vendor="Amazonas"

RUN yum install httpd -y
WORKDIR /var/www/html
COPY simple-project .

ENV contenido prueba
RUN echo "$contenido" > ./prueba.html

RUN echo "$(whoami)" > ./user1.html
RUN useradd pepita
USER pepita
RUN echo "$(whoami)" > /tmp/user2.html
USER root
RUN cp /tmp/user2.html ./user2.html

COPY run-cmd.sh ./run-cmd.sh
CMD sh ./run-cmd.sh

