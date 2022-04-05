#!/bin/sh -ue
. ./.export.sh
. ./tmp1.sh

curl -X POST \
  -H "Content-Type: application/json" \
  -d "{\"executionArn\": \"$executionArn\"}" \
  "${HelloApi}/result"
