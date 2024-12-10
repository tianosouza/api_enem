# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.3.0
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

RUN apt-get update -qq && \
    apt-get install -y \
    nodejs \
    npm \
    postgresql-client \
    imagemagick \
    libvips \
    curl \
    gnupg \
    libpq-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y yarn

RUN npm install -g npx

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .