#!/bin/bash

version=$(curl -s https://api.github.com/repos/caddyserver/caddy/releases/latest | jq -r .tag_name)
v=$(echo $version | cut -dv -f2)

mkdir _

mkdir __
curl -L https://github.com/caddyserver/caddy/releases/download/$version/caddy_${v}_freebsd_amd64.tar.gz -o __/_.tgz
cd __
tar zxf _.tgz
mv caddy ../_/caddy_freebsd_amd64
cd ..
rm -rf __

mkdir __
curl -L https://github.com/caddyserver/caddy/releases/download/$version/caddy_${v}_linux_amd64.tar.gz -o __/_.tgz
cd __
tar zxf _.tgz
mv caddy ../_/caddy_linux_amd64
cd ..
rm -rf __

mkdir __
curl -L https://github.com/caddyserver/caddy/releases/download/$version/caddy_${v}_windows_amd64.zip -o __/_.zip
cd __
unzip _.zip
mv caddy.exe ../_/caddy_windows_amd64.exe
cd ..
rm -rf __

mkdir __
curl -L https://github.com/caddyserver/caddy/releases/download/$version/caddy_${v}_mac_amd64.tar.gz -o __/_.tgz
cd __
tar zxf _.tgz
mv caddy ../_/caddy_darwin_amd64
cd ..
rm -rf __

nami release github.com/namipkg/caddy $version _
rm -rf _
