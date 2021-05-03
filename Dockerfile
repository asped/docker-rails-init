FROM ruby:2.7.2


RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp
COPY bashrc ~/.bashrc
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
