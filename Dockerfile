FROM ruby:2.5.0

ENV PATH /root/.yarn/bin:$PATH

RUN apt-get update -qq && apt-get install -y mysql-client build-essential libpq-dev apt-transport-https

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG PROJECT_NAME
ARG RAILS_ENV

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION=ap-southeast-2
ENV RAILS_ENV=$RAILS_ENV
ENV NODE_ENV=production

# Install AWS CLI
RUN apt-get install python-pip python-dev build-essential -y
RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv
RUN pip install awscli

# Pull existing assets from S3

RUN mkdir -p /var/shopping-list
WORKDIR /var/shopping-list

# Copy in rest of the app
COPY . .

RUN aws s3api put-object --bucket boost-drone-cache --key $PROJECT_NAME

# Fetch cached content from s3
RUN aws s3 cp s3://boost-drone-cache/$PROJECT_NAME/cache_assets.tar.gz . --quiet; exit 0
RUN aws s3 cp s3://boost-drone-cache/$PROJECT_NAME/public_assets.tar.gz . --quiet; exit 0
RUN aws s3 cp s3://boost-drone-cache/$PROJECT_NAME/vendor_cache.tar.gz . --quiet; exit 0

# Untar fetched dependencies
RUN tar -xzf cache_assets.tar.gz tmp/cache/; exit 0
RUN tar -xzf public_assets.tar.gz public/; exit 0
RUN tar -xzf vendor_cache.tar.gz vendor/; exit 0

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -

RUN gem install bundler
RUN bundle install --path vendor/cache

RUN RAILS_ENV=$RAILS_ENV bundle exec rails assets:precompile

# tar the file
RUN tar -czf cache_assets.tar.gz tmp/cache/assets
RUN tar -czf public_assets.tar.gz public/assets
RUN tar -czf vendor_cache.tar.gz vendor/cache

# Push assets to S3

RUN aws s3 cp cache_assets.tar.gz s3://boost-drone-cache/$PROJECT_NAME/cache_assets.tar.gz --quiet
RUN aws s3 cp public_assets.tar.gz s3://boost-drone-cache/$PROJECT_NAME/public_assets.tar.gz --quiet
RUN aws s3 cp vendor_cache.tar.gz s3://boost-drone-cache/$PROJECT_NAME/vendor_cache.tar.gz --quiet

RUN bundle exec rake assets:clean[1]

# EXPOSE 3000
#
# CMD bundle exec rails s -b 0.0.0.0
