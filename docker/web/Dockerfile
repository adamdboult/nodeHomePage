FROM node:16
RUN apt-get update && apt-get -y install \
  build-essential                        \
  python3                                \
  pandoc                                 \
  texlive-full
#RUN apt-get -y install \
#  apache2                                \
#  git                                    \

# Avoid ascii errors when reading files in Python
ENV LANG C.UTF-8

# Needed for the empty folder stuff to work
WORKDIR /Projects/nodeHomePage/

COPY . .
RUN npm ci && make
CMD [ "node", "server.js", "80" ]
