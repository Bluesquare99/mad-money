#!/usr/bin/env bash

gpodder_dir="/Users/maxmccready/coding/projects/gpodder"
download_dir="/Users/maxmccready/Downloads"
pod_dir="$download_dir/Mad Money w_ Jim Cramer"
pod_url="https://feeds.simplecast.com/TkQfZXMD"

source $gpodder_dir/.venv/bin/activate
./download_latest_ep.sh $gpodder_dir $download_dir $pod_url
deactivate

latest_ep=$(ls -Art "$pod_dir" | tail -n 1)
echo $latest_ep