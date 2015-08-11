#!/usr/bin/env bash

mat_version=$(curl -s -o - "https://eclipse.org/mat/downloads.php" | grep '<b>Version</b>:' | awk '{print $2}')
dl_url="https://www.eclipse.org/downloads/download.php?file=/mat/1.5/rcp/MemoryAnalyzer-${mat_version}-linux.gtk.x86_64.zip&r=1"
dl_file=$(mktemp)

if [[ -e "eclipse-mat-${mat_version}-1.x86_64.rpm" ]]; then
    echo "Latest version already built, exiting."
    exit 0
fi

echo "Downloading..."
curl -s -L -o ${dl_file} "${dl_url}"
echo "Building..."
fpm -s zip -t rpm -n "eclipse-mat" -v ${mat_version} --prefix=/opt ${dl_file}
echo "Cleaning up..."
test -e ${dl_file} && rm ${dl_file}
exit 0
