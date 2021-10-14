# Based on Docker image with the small Linux distro Alpine with Node preinstalled
# Stage 1 - build app
FROM node:latest as build
COPY . /app
WORKDIR /app
RUN npm i
RUN npm run build

# Stage 2 - production image
#FROM alpine as production
FROM nginx:stable-alpine as production
LABEL maintainer="Peter"

# create and set workdir in image
# WORKDIR /app
# copy from build folder of build image to current workdir
COPY --from=build /app/build /usr/share/nginx/html

# container exposes port 80 to other containers on the same docker network - but not to the host
# not necessary as the -p tag is used at runtime to expose and bind ports
# EXPOSE 80

# 
# docker run --rm -p 8080:80 r6
# --rm removed container after exit - else use <docker container prune> after exit
# -p publish the container port(s) to the host (publishes 80 in container to 8080 on the host or bind port 80 in container to port 8080 on host)