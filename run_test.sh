#!/bin/sh -ue
WHO=Ayu

. ./export1.sh

curl -X POST \
  -H "Content-Type: application/json" \
  -d "{\"who\": \"$WHO\"}" \
  -o tmp1.json \
  "${HelloWorldApi}/run"

cat tmp1.json
executionArn=$(jq -r .executionArn tmp1.json)
echo "executionArn=$executionArn" >tmp1.sh
