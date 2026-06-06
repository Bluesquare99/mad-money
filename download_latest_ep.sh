#!/usr/bin/env bash

export GPODDER_DOWNLOAD_DIR="$1"

pod_dir="$GPODDER_DOWNLOAD_DIR/Mad Money w_ Jim Cramer"
pod_url="https://feeds.simplecast.com/TkQfZXMD"

if [[ -d $pod_dir ]]; then
    rm -rf $pod_dir
else 
    echo "Mad Money directory not found, skipping deletion."
fi

bin/gpo -q update 
ep_string=$(bin/gpo -q episodes --guid | grep $(date +%-m/%-d/%-y))
if [[ -z $ep_string ]]; then
    echo "Episode for today's date not found"
    exit 1
fi
ep_guid=$(echo $ep_string | cut -d" " -f2) # Where the GUID shows up in returned string.
bin/gpo -q download $pod_url $ep_guid

echo $pod_dir
