FROM ubuntu:15.10

EXPOSE 4567

RUN apt-get update && \
  apt-get install -y \
  curl \
  software-properties-common && \
  curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
  apt-add-repository ppa:brightbox/ruby-ng && \
  apt-get update && \
  apt-get install -y \
  build-essential \
  git \
  ruby2.2 \
  ruby2.2-dev \
  rubygems \
  nodejs \
  zlib1g-dev

RUN gem install middleman

RUN mkdir /src
WORKDIR /src

RUN middleman init

VOLUME /src

ENTRYPOINT ["bundle", "exec", "middleman"]
CMD ["server"]
