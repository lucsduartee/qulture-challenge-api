# syntax=docker/dockerfile:1
FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /qulture-challenge-api

COPY Gemfile /qulture-challenge-api/Gemfile
COPY Gemfile.lock /qulture-challenge-api/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]