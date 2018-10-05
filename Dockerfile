FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y mysql-client build-essential libpq-dev apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# ENV
ARG RAILS_ENV
ENV RAILS_ENV=$RAILS_ENV
# avoid installing node development dependencies
ENV NODE_ENV=production

# Copy in rest of the app
RUN mkdir -p /var/shopping-list
WORKDIR /var/shopping-list
COPY . .
RUN gem install bundler
RUN bundle install

#RUN RAILS_ENV=$RAILS_ENV bundle exec rails assets:precompile

EXPOSE 3000

CMD bundle exec rails s -b 0.0.0.0
