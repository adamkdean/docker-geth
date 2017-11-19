FROM ubuntu:xenial
MAINTAINER Adam K Dean <akd@dadi.co>

# install add-apt-repository
RUN apt-get update -qq
RUN apt-get install software-properties-common -qq

# install ethereum
RUN add-apt-repository ppa:ethereum/ethereum
RUN apt-get update -qq
RUN apt-get install ethereum -qq

WORKDIR /
COPY entrypoint.sh .
COPY genesis.json .

EXPOSE 8545

CMD ["bash", "entrypoint.sh"]