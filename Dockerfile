# File name : Dockerfile
# choose the base image.
# debian linux + nodejs
FROM node:22.11.0

# Set a work directory
WORKDIR /app

# copy the build files and node packages into the work directory
COPY .next .next
COPY package.json .
COPY package-lock.json .
COPY public public
COPY node_modules node_modules

# EXPOSE the port of the application
EXPOSE 3005

# the command to start the app
ENTRYPOINT ["npm", "start"] 