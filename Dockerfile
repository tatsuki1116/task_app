FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /task_app
WORKDIR /task_app
COPY Gemfile /task_app/Gemfile
COPY Gemfile.lock /task_app/Gemfile.lock
RUN bundle install
COPY . /task_app

CMD ["rails", "server", "-b", "0.0.0.0"]
