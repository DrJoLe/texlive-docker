FROM ubuntu:20.04

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir install-tl && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -C install-tl --strip-components 1 -xzf install-tl-unx.tar.gz
ENV DEBIAN_FRONTEND=newt

WORKDIR /work/install-tl

COPY texlive.profile .

RUN install-tl --profile=texlive.profile
