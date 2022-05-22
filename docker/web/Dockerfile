FROM node:16
RUN apt-get update && apt-get -y install build-essential apache2 git python3 pandoc texlive-full

# Avoid ascii errors when reading files in Python
ENV LANG C.UTF-8

# Needed for the empty folder stuff to work
WORKDIR /Projects/nodeHomePage/

COPY . .
RUN npm install && make
CMD [ "node", "server.js", "80" ]
