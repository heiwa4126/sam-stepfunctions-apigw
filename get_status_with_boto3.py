#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# pylint: disable-msg=C0103, C0111
"""
Boto3でdescribe_executionを呼ぶ.
https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/stepfunctions.html#SFN.Client.describe_execution
"""
import json

import boto3


def main():
    """main"""
    with open("./tmp1.json") as f:
        data = json.load(f)

    SFN = boto3.client("stepfunctions")

    res = SFN.describe_execution(executionArn=data["executionArn"])
    print(res)


if __name__ == "__main__":
    main()
