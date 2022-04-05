#!/bin/sh -ue
WHO=Ayu

. ./export1.sh

curl -X POST \
  -H "Content-Type: application/json" \
  -d "{\"who\": \"$WHO\"}" \
  "${HelloWorldApi}/run"

# https://docs.aws.amazon.com/ja_jp/apigateway/latest/developerguide/request-response-data-mappings.html
# によると、Content-Typeのデフォルト値はapplication/jsonなので、省略可能らしい。
