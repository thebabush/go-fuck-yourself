FROM ubuntu:18.04

RUN apt-get update && apt-get install -y unzip wget tar ca-certificates git build-essential

RUN wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz -O /tmp/go.tar.gz
RUN tar xvf /tmp/go.tar.gz
RUN mkdir -p /opt/go && cp -r go /opt/go/gfy
ADD . /work
RUN cd /opt/go/gfy/src && /work/gfy.sh && GOROOT_BOOTSTRAP=/go ./make.bash

RUN mkdir -p /out
RUN cd /opt/go && tar -zcvf /out/gfy.tar.gz gfy

