#DockerImage with bash and xml, vlocity script for salesforce
FROM frekele/java:jdk8
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
