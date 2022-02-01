FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends texlive-full
RUN apt-get install -y --no-install-recommends inkscape
ENV DEBIAN_FRONTEND=newt
