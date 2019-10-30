#DockerImage with bash and xml script for salesforce
FROM alpine
MAINTAINER Vishal <vinu.vizal@gmail.com>
RUN apk update
RUN apk add bash
RUN apk add git
RUN apk add openjdk8
RUN apk add apache-ant --update-cache \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	--allow-untrusted
RUN apk add xmlstarlet bash --update --repository http://dl-4.alpinelinux.org/alpine/edge/testing \
	&& rm -rf /var/cache/apk/*
#added vlocity code
RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN  yum install nodejs
RUN npm install --global pkg

# declare /vlocity_build as working directory of image
WORKDIR /vlocity_build

COPY ./package*.json /vlocity_build/

RUN npm install

# Important to do this final part last because of how docker builds image
# copy all remaining files/folders in project directory to the container
COPY . /vlocity_build
# till here
ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin
