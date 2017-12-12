FROM starefossen/ruby-node

RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential

RUN gem update bundler

# Setup App
RUN mkdir -p /evil_chat
WORKDIR /evil_chat
COPY . .

ENV BUNDLE_PATH=/bundle \
BUNDLE_BIN=/bundle/bin \
GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
