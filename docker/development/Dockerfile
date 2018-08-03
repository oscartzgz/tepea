FROM ruby:2.3.1
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs imagemagick
# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/tepeapul.co
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./
RUN gem install bundler  && bundle install

# Adding project files
COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]