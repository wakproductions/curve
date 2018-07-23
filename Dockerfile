FROM ruby:2.5.1-alpine

RUN apk update && apk add \
  build-base \
  postgresql-dev \
  libcurl \
  netcat-openbsd \
  nodejs \
  yarn

WORKDIR /app
ADD . /app

RUN gem install bundler -v 1.16.1
RUN bundle install

