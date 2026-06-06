#!/usr/bin/env bash

source .venv/bin/activate

download_dir="/Users/maxmccready/Downloads"
podcast_dir=$(sh download_latest_ep.sh $download_dir)
echo $podcast_dr
