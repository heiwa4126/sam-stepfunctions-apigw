#!/bin/sh -ue

## required tomlq in yq. Try `apt install jq` and `pip3 install yq`
STACK_NAME=$(tomlq -r .default.deploy.parameters.stack_name samconfig.toml)
AWS_REGION=$(tomlq -r .default.deploy.parameters.region samconfig.toml)
export AWS_REGION

HelloApi=$(
  aws cloudformation describe-stacks --stack-name "$STACK_NAME" |
    jq -r '.Stacks[0].Outputs[]|select(.OutputKey=="HelloApi").OutputValue'
)

echo "HelloApi=$HelloApi" >.export.sh
