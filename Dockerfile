FROM debian:buster

COPY install.sh /install.sh

RUN /install.sh
