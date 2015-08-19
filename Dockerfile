FROM ruby:2.1
MAINTAINER "Mike Farrow" <contact@mikefarrow.co.uk>

RUN apt-get update \
  && apt-get install -y \
    node \
    python-pygments \
  && apt-get clean

RUN gem install \
  github-pages \
  jekyll \
  jekyll-redirect-from \
  kramdown \
  rdiscount \
  rouge \
  redcarpet

RUN gem install jekyll-picture-tag -v "~> 0.2.3"

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]
