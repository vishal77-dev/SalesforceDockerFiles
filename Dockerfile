#dockerfile for vlocity deployment
FROM node:10
MAINTAINER Vishal <vinu.vizal@gmail.com>
RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get install -y jq
RUN apt-get install -y libc6:i386 libstdc++6:i386

RUN npm install --global publish-release 

RUN npm install --global pkg-fetch
RUN pkg-fetch -n node10 -p win -a x64
RUN pkg-fetch -n node10 -p linux -a x64
RUN pkg-fetch -n node10 -p macos -a x64

RUN npm install --global pkg
RUN npm install --global vlocity
