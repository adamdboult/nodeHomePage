FROM node:10
RUN apt-get update && apt-get -y install build-essential apache2 git python3 pandoc texlive-full

# Needed for the empty folder stuff to work
WORKDIR /Projects/nodeHomePage/

COPY . .
RUN npm install && npx gulp
CMD [ "node", "server.js", "80" ]
