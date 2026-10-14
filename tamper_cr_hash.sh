#!/usr/bin/env bash
# DO NOT RUN until the hash-mismatch test. Replaces cr_hash-1.0.0.tar.gz with different
# content on the release WITHOUT touching index.json (so the index hash no longer matches).
set -euo pipefail
R=caterryan/influxdb3-plugins-registry-test
W=$(mktemp -d); N=cr_hash-1.0.0
cd "$(dirname "$0")"
mkdir -p "$W/$N"; cp plugins/$N/* "$W/$N/"
echo 'CR_TAMPERED = True' >> "$W/$N/cr_hash.py"
tar -C "$W" -czf "$W/$N.tar.gz" "$N"
gh release upload registry "$W/$N.tar.gz" -R $R --clobber
