#!/usr/bin/env bash

yjp_version=$(curl -s -o - https://www.yourkit.com/download/ | grep '<h3 id="download">' | sed -e 's/<[^>]\+>//g' -e 's/,//' | cut -f4-6 -d" " --output-delimiter="-" | tr -d '[:space:]' | sed -e 's/build-/b/')
echo "Latest version is ${yjp_version}"

dl_url="https://www.yourkit.com/download/yjp-${yjp_version}-linux.tar.bz2"
dl_file=$(mktemp)

if [[ -e "yjp-${yjp_version}-1.x86_64.rpm" ]]; then
    echo "Latest version already built, exiting."
    exit 0
fi

echo "Downloading..."
curl -L -o ${dl_file} "${dl_url}"
echo "Building..."
fpm -s tar -t rpm -n "yjp" -v ${yjp_version} --prefix=/opt ${dl_file}
echo "Creating Desktop File..."
cat <<EOF > yjp.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=YourKit Java Profiler
Categories=;
Comment=YourKit Java Profiler
Exec=/opt/$yjp_version/bin/yjp.sh
Icon=/opt/$yjp_version/bin/yjp.ico
Hidden=false
Txerminal=false
Type=Application
EOF
echo "Cleaning up..."
test -e ${dl_file} && rm ${dl_file}
exit 0
