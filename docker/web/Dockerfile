FROM node:22 AS node-build

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
COPY vendor/pnpm-store ./vendor/pnpm-store
COPY vendor/npm ./vendor/npm

RUN npm install -g ./vendor/npm/pnpm_tgz/pnpm-10.33.0.tgz --prefix vendor/npm/pnpm_bin/

RUN ./vendor/npm/pnpm_bin/bin/pnpm install --offline --frozen-lockfile --prod --store-dir vendor/pnpm-store

FROM node:22

WORKDIR /app

COPY --from=node-build /app/node_modules ./node_modules

ENV PATH="/usr/local/lib/node_modules/.bin:$PATH"

#  python3-pip                                                       \
#  python3.11-dev                                                    \
RUN apt-get update && apt-get install --no-install-recommends --yes \
  python3.11                                                        \
  python3.11-venv                                                   \
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
ENV PATH="/opt/venv/bin:$PATH"

# Avoid ascii errors when reading files in Python
ENV LANG C.UTF-8

COPY . .

RUN make

CMD [ "node", "server.js", "80" ]

