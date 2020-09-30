# Use the official image as a parent image.
FROM node:current-slim
#FROM ubuntu:18.04

# Set the working directory.
WORKDIR /usr/src/nodeHomePage

# Update/upgrade
RUN apt-get update
RUN apt-get -y upgrade

# Install basic stuff
RUN apt-get -y install build-essential apache2 git

# Used for creating the PDF files
RUN apt-get -y install pandoc texlive-full

# Install python
RUN apt-get -y install python3

# Install node
#RUN apt-get -y install nodejs npm
#RUN npm -g install npx

# Copy the file from your host to your current location.
#COPY package.json .
#COPY bower.json .
COPY . .

# Install
RUN npm install
RUN npx bower --allow-root install
RUN npx gulp

# Add metadata to the image to describe which port the container is listening on at runtime.
EXPOSE 3000

# Run the specified command within the container.
CMD [ "node", "server.js" ]

