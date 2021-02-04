FROM ubuntu:18.04

RUN apt-get update -qq
RUN apt-get install -qq build-essential curl vim
