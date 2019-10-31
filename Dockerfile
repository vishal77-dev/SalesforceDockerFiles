#DockerImage with bash and xml, vlocity script for salesforce
FROM alpine
MAINTAINER Vishal <vinu.vizal@gmail.com>

RUN apk add bash
RUN apk add curl
RUN apk add git
RUN apk add openjdk8
RUN apk add apache-ant --update-cache \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	--allow-untrusted
RUN apk add xmlstarlet bash --update --repository http://dl-4.alpinelinux.org/alpine/edge/testing \
	&& rm -rf /var/cache/apk/*
	
ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin	

FROM node:10
MAINTAINER Vishal <vinu.vizal@gmail.com>

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y jq
RUN apt-get install -y libc6:i386 libstdc++6:i386

RUN npm install --global sfdx-cli 
RUN npm install --global publish-release 

RUN npm install --global pkg-fetch
RUN pkg-fetch -n node10 -p win -a x64
RUN pkg-fetch -n node10 -p linux -a x64
RUN pkg-fetch -n node10 -p macos -a x64

RUN npm install --global pkg
RUN npm install --global vlocity
