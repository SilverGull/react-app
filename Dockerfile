# Based on Docker image with the small Linux distro Alpine with Node preinstalled
FROM node:alpine

LABEL maintainer="Peter"

# copy from current dir to image dir
COPY . /app

# workdir in image
WORKDIR /app

# install dependencies
RUN npm i

EXPOSE 3000

# start app
CMD ["npm", "start"]

# 
# docker run --rm -p 8080:3000 r1
# --rm removed container after exit - else use <docker container prune> after exit
# -p publish the container port(s) to the host (publishes 3000 in container to 8080 on the host)