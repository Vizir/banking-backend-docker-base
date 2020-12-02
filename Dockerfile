FROM debian:buster

COPY docker/install.sh /install.sh

RUN /install.sh
