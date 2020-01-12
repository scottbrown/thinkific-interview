FROM ubuntu:19.04
MAINTAINER Scott Brown <mail@typicalrunt.me>

ARG RUBY_MAJOR_VERSION="2.6"
ARG RUBY_MINOR_VERSION="3"
ARG RUBY_SHA256="577fd3795f22b8d91c1d4e6733637b0394d4082db659fccf224c774a2b1c82fb"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y wget build-essential zlib1g-dev libssl-dev postgresql-client libpq-dev libsqlite3-dev tzdata nodejs

RUN wget -O /tmp/ruby.tar.gz http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR_VERSION/ruby-$RUBY_MAJOR_VERSION.$RUBY_MINOR_VERSION.tar.gz
# TODO validate SHA-256 checksum or fail
RUN cd /tmp && tar xfz ruby.tar.gz
RUN cd /tmp/ruby-$RUBY_MAJOR_VERSION.$RUBY_MINOR_VERSION && ./configure --prefix=/usr/local && make && make install

RUN mkdir -p /app
ADD . /app
WORKDIR /app
RUN bundle install

EXPOSE 80
CMD bundle exec rails server -b 0.0.0.0 -p 80 -e production
