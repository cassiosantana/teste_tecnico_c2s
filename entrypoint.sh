#!/bin/bash
set -e

bundle exec rails db:create

bundle exec rails db:migrate

rm -f /app/tmp/pids/server.pid

bundle exec rails s -b '0.0.0.0'