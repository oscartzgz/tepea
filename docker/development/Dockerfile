FROM ruby:2.3.1
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev imagemagick apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs yarn
# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /usr/src/app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock package.json ./
RUN gem install bundler && bundle install
RUN yarn install

# Adding project files
COPY . .
EXPOSE 3000 1025 1080
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]