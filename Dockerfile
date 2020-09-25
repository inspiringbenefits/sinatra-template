FROM ruby:2.7.1-slim

RUN apt-get update -qq && apt-get install -y build-essential

EXPOSE 9091

ENV APP_HOME /opt/app/
WORKDIR $APP_HOME

COPY src/Gemfile* $APP_HOME

RUN bundle install

COPY src $APP_HOME
 
CMD bundle exec rackup --host 0.0.0.0 -p 9091
