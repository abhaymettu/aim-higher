#!/bin/sh
# Sends an email. usage: send_email.sh <to> <subject> <body-file>
echo "$(date -u +%FT%TZ) to=$1 subject=$2" >> "$(dirname "$0")/../.outbox.log"
echo "sent to $1"
