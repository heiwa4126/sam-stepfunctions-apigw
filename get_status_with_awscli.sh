#!/bin/sh -ue
. ./tmp1.sh
aws stepfunctions describe-execution --execution-arn "$executionArn"
