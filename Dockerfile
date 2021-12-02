FROM alpine:latest

WORKDIR /install-tl

COPY texlive.profile .

RUN apk add --no-cache ca-certificates perl wget tar xz && \
    wget "https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz" && \
    tar -xzf install-tl-unx.tar.gz -C /install-tl --strip-components=1 && \
    ./install-tl --profile=texlive.profile

ENV PATH="/usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH"

RUN tlmgr install scheme-full

RUN cd && \
    rm -rf /install-tl && \
    apk del ca-certificates perl wget tar xz
