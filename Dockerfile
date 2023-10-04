FROM ubuntu:20.04

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    ghostscript \
    perl \
    tzdata \
    wget
ENV DEBIAN_FRONTEND=newt

RUN mkdir install-tl && \
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -C install-tl --strip-components 1 -xzf install-tl-unx.tar.gz

WORKDIR /work/install-tl

COPY texlive.profile .

RUN perl install-tl --profile=texlive.profile

ENV PATH="/usr/local/texlive/current_year/bin/x86_64-linux:$PATH"
