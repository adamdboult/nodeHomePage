FROM node:22 AS node-build
RUN npm install -g npm@latest

WORKDIR /app

COPY package.json package-lock.json ./

ENV NODE_ENV=production
RUN npm ci

FROM node:22

WORKDIR /app

COPY --from=node-build /app/node_modules ./node_modules

ENV PATH="/usr/local/lib/node_modules/.bin:$PATH"

RUN apt-get update && apt-get install --no-install-recommends --yes \
  python3.11                                                        \
  python3.11-venv                                                   \
  python3.11-dev                                                    \
  python3-pip                                                       \
  pandoc                                                            \
  texlive-latex-base                                                \
  texlive-latex-recommended                                         \
  texlive-latex-extra                                               \
  texlive-fonts-recommended                                         \
  && apt-get clean                                                  \
  && rm -rf /var/lib/apt/lists/*                                    \
  && rm -rf /usr/share/doc/* /usr/share/man/*

# One reason to do this is so we can use "python" rather than "python3" in the makefile, even if we don't need to install any packages from requirements.txt
RUN python3 -m venv /opt/venv
#RUN /opt/venv/bin/pip install --disable-pip-version-check --no-cache-dir --no-deps --require-hashes -r requirements.txt
ENV PATH="/opt/venv/bin:$PATH"

# Avoid ascii errors when reading files in Python
ENV LANG C.UTF-8

COPY . .

RUN make

CMD [ "node", "server.js", "80" ]

