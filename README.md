This is a simple exporter for various statistics relating to a Postfix
server.


# Features

* Examines mail queue periodically and exports `postfix_mail_queue_size`;

* Reads syslog entries as they happen, and exports disposition status
  counters (`postfix_disposition`) per DSN, as well as delay summaries per
  DSN;

* Drinks from the syslog stream directly.


# Deployment

The default way of rolling out this exporter is as a Docker container.  For
that, you'll want to setup a volume for the postfix queue (making it
available in the container as `/var/spool/postfix`), and some env
vars.  You can also run it directly (via the gem), with the same env vars,
and with the expectation that `/var/spool/postfix` is in the usual place.


## Environment Variables

* `SYSLOG_SOCKET` -- where to read raw syslog events from.  If you're
  running Postfix in an isolated container, you can probably hook up
  `/dev/log` directly between containers with a bit of shenanigans,
  otherwise configure your syslog daemon to write out a copy of all `mail`
  facility messages to a custom socket.  Alternately, if you use logstash,
  take a look at the [`syslogstash`
  gem](https://rubygems.org/gems/syslogstash) and
  [container](https://hub.docker.com/r/discourse/syslogstash/), and go forth
  and sin no more.
