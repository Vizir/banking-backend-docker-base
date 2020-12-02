#!/bin/bash

set -euo pipefail

apt-get update
apt-get install -y curl

# nodejs
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt-get install -y \
  dumb-init \
  git \
  nginx \
  nodejs \
  python \
  python-pip \
  supervisor \
  vim \
  yarn

pip install --no-cache-dir awscli

# cleanup
apt-get clean -y
rm -rf /var/apt/lists/*
rm -rf /var/cache/*
truncate -s 0 /var/log/*log

# redirect nginx logs to stdout/stderr
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
