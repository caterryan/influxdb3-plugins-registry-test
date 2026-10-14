#!/usr/bin/env bash
# Usage: ./publish.sh plugins/<name>-<version>   (or unpublished/<name>-<version>)
# Packages the plugin against the current registry index and uploads artifact + new index.json.
set -euo pipefail
R=caterryan/influxdb3-plugins-registry-test
W=$(mktemp -d)
gh release download registry -R $R -p index.json -D "$W/in"
influxdb3-plugin package "$1" --index "$W/in/index.json" --out "$W/out" --output human
gh release upload registry -R $R "$W"/out/*.tar.gz
gh release upload registry -R $R "$W/out/index.json" --clobber
