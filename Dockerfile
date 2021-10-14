# Based on Docker image with the small Linux distro Alpine with Node preinstalled
FROM node:alpine

LABEL maintainer="Peter"

# copy from current dir to image dir
COPY . /app

# workdir in image
WORKDIR /app

# install dependencies
RUN npm i

# container exposes port 3000 to other containers on the same docker network - but not to the host
# not necessary as the -p tag is used at runtime to expose and bind ports
# EXPOSE 3000

# start app
CMD ["npm", "start"]

# 
# docker run --rm -p 8080:3000 r1
# --rm removed container after exit - else use <docker container prune> after exit
# -p publish the container port(s) to the host (publishes 3000 in container to 8080 on the host or bind port 3000 in container to port 8080 on host)