#!/bin/bash

curl -s https://api.github.com/repos/k14s/kapp/releases/latest | \
    jq --raw-output '.assets[] | select(.name | endswith("-linux-amd64")) | .browser_download_url' | \
    xargs curl -sLfo /usr/local/bin/kapp
chmod +x /usr/local/bin/kapp
