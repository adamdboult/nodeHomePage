FROM node:22
RUN apt-get update && apt-get install --no-install-recommends --yes \
  python3.11                                                        \
  pandoc                                                            \
  texlive-latex-base                                                \
  texlive-latex-recommended                                         \
  texlive-latex-extra                                               \
  texlive-fonts-recommended                                         \
  && apt-get clean                                                  \
  && rm -rf /var/lib/apt/lists/*                                    \
  && rm -rf /usr/share/doc/* /usr/share/man/*

# Avoid ascii errors when reading files in Python
ENV LANG C.UTF-8

# Needed for the empty folder stuff to work
WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN make

CMD [ "node", "server.js", "80" ]

