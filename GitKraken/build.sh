#!/usr/bin/env bash

version=$(curl -s -o - "https://www.gitkraken.com/download/linux-gzip" | grep 'Version </span>' | sed  -e 's/.*span>//' -e 's/<\/h2>//')
dl_url="https://www.gitkraken.com/download/linux-gzip"
dl_file=$(mktemp)

if [[ -e "gitkraken-${version}.x86_64.rpm" ]]; then
    echo "Latest version already built, exiting."
    exit 0
fi

echo "Downloading..."
curl -s -L -o ${dl_file} "${dl_url}"
echo "Building..."
fpm -s tar -t rpm -n "gitkraken" -v ${version} --prefix=/opt ${dl_file}
echo "Cleaning up..."
test -e ${dl_file} && rm ${dl_file}
exit 0
