#!/usr/bin/env bash

gpodder_dir="$1"
download_dir="$2"
pod_url="$3"
gpo="$gpodder_dir/bin/gpo"
export GPODDER_DOWNLOAD_DIR="$download_dir"

download_ep() {
    gpo -q update 
    ep_string=$(gpo -q episodes --guid | grep $(date +%-m/%-d/%-y))
    if [[ -z $ep_string ]]; then
        echo "Episode for today's date not found"
        exit 1
    fi
    ep_guid=$(echo $ep_string | cut -d" " -f2) # Where the GUID shows up in returned string.
    gpo -q download $pod_url $ep_guid
}

download_ep