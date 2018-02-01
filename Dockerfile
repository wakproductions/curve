FROM ruby:2.4.2
RUN apt-get update
RUN apt-get install -y nodejs # Node is needed for certain Javascript add-ons like Uglifier of Coffee-rails
RUN apt-get install -y netcat # Needed for wait-for-database.sh script
WORKDIR /app
ADD . /app

RUN gem install bundler -v 1.15.0
RUN bundle install

