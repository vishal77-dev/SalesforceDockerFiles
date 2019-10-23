#DockerImage with bash and xml script for salesforce
FROM alpine
MAINTAINER Vishal <vinu.vizal@gmail.com>
RUN apk update
RUN apk add bash
RUN apk add openjdk8
RUN apk add apache-ant --update-cache \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	--allow-untrusted
RUN apk add xmlstarlet bash --update --repository http://dl-4.alpinelinux.org/alpine/edge/testing \
	&& rm -rf /var/cache/apk/*

ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin
