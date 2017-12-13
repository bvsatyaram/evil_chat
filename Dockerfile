FROM starefossen/ruby-node

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential vim

RUN git config --global user.email "bvsatyaram@gmail.com"
RUN git config --global user.name "BV Satyaram"
RUN git config --global core.editor "vim"

RUN gem update bundler

# Setup App
RUN mkdir -p /evil_chat
WORKDIR /evil_chat
COPY . .

RUN git config core.fileMode false

ENV BUNDLE_PATH=/bundle \
BUNDLE_BIN=/bundle/bin \
GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
