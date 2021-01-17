# Use the official image as a parent image.
FROM node:10

# Update/upgrade
RUN apt-get update && apt-get -y upgrade

# Install basic stuff
RUN apt-get -y install build-essential apache2 git

# Install python
RUN apt-get -y install python3

# Used for creating the PDF files
RUN apt-get -y install pandoc texlive-full

# Set the working directory.
WORKDIR /usr/src/nodeHomePage

# Copy the file from your host to your current location.
COPY . .

# Install
RUN npm install
RUN npx gulp

# Add metadata to the image to describe which port the container is listening on at runtime.
EXPOSE 3000

# Run the specified command within the container.
CMD [ "node", "server.js", "3000"]

