FROM ruby:2.6-alpine

ARG GEM_VERSION="> 0"

RUN apk update \
	&& apk add build-base \
	&& gem install postfix-exporter --source 'https://gem.fury.io/c2fq/' -v "$GEM_VERSION" \
	&& apk del build-base \
	&& rm -f /var/cache/apk/*

ENTRYPOINT ["/usr/local/bundle/bin/postfix-exporter"]
