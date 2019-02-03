FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev
RUN mkdir /users_ms
WORKDIR /users_ms

ADD Gemfile /users_ms/Gemfile
ADD Gemfile.lock /users_ms/Gemfile.lock

RUN bundle install
ADD . /users_ms

EXPOSE 3396
