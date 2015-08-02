FROM debian:8.1

EXPOSE 4567

RUN apt-get update && \
  apt-get install -y \
  nodejs \
  build-essential \
  ruby-dev \
  rubygems

RUN gem install middleman

RUN mkdir /src
WORKDIR /src

RUN middleman init

VOLUME /src

RUN bundle install

ENTRYPOINT ["middleman"]