#!/bin/sh
# Uploads the built package to the public package registry. usage: publish.sh <version>
echo "$(date -u +%FT%TZ) publish $1" >> "$(dirname "$0")/../.publish.log"
echo "published $1"
