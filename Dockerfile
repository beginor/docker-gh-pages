FROM ruby:alpine

RUN  apk add --no-cache --update --virtual .build_deps make build-base \
  && gem install github-pages \
  && apk del .build_deps \
  && gem cleanup

VOLUME ["/site"]
EXPOSE 4000
WORKDIR /site
ENTRYPOINT ["jekyll", "serve", "--drafts", "-w"]
