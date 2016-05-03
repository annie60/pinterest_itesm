FROM ruby:2.3.0
MAINTAINER Abraham Kuri <kurenn@icalialabs.com>

ENV PATH=/usr/src/app/bin:$PATH RAILS_ENV=production RACK_ENV=production

WORKDIR /usr/src/app

# 1: Install dependencies:

# 1.1: Copy just the Gemfile & Gemfile.lock, to avoid the build cache failing
# whenever any other file changed and installing dependencies all over again - a
# must if your'e developing this Dockerfile...
ADD ./Gemfile* /usr/src/app/

# 2: Copy the rest of the code, and then compile the assets:
ADD . /usr/src/app

RUN bundle install --deployment --without development test
RUN DATABASE_URL=postgres://postgres:c@postgres.example.com:5432/blah \
    HOST_DEFAULT_URL=pinterest.dev \
    rake assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]