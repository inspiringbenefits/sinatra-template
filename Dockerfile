FROM ruby:2.7.1-slim

RUN apt-get update -qq && apt-get install -y build-essential

EXPOSE 9091

ENV APP_HOME /opt/app/
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY src/Gemfile* $APP_HOME

COPY src $APP_HOME
 
CMD bundle exec rackup --host 0.0.0.0 -p 9091
