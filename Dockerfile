FROM nuagebec/ubuntu:latest

MAINTAINER Floyd

RUN apt-get update && apt-get install -y \
        bc \
        && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*
