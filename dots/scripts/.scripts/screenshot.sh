#!/bin/sh

name="$(echo | bemenu $opts -p 'Enter filename').png"
screenshot_dir="${HOME}/media/screenshots"
grimshot --notify save area "${screenshot_dir}/${name}"
