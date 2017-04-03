FROM ruby:2.3-alpine

RUN apk update \
	&& apk add build-base \
	&& gem install postfix-exporter -v 1.0.2 \
	&& apk del build-base \
	&& rm -f /var/cache/apk/*

ENTRYPOINT ["/usr/local/bundle/bin/postfix-exporter"]
