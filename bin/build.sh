#!/bin/bash -eu
sky2_viewer="$(cd "$(dirname $0)"; cd ..; pwd)"

# Usage:
#   build.sh [result path] [pages path]
result_path="$1"
pages_path="$2"

# install execjs runtime
set -x
apt-get update && apt-get install -y nodejs

# build viewer
cd "$sky2_viewer"
bundle install -j4
ln -s "$pages_path" build
env \
  RESULT_PATH="$result_path" \
  TZ="Asia/Tokyo" \
  bundle exec middleman build --verbose
