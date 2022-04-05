import json

import boto3


def lambda_handler(event, context):
    payload = json.loads(event["body"])

    SFN = boto3.client("stepfunctions")
    # 対象のStep Functionsと同じアカウント同じリージョンにあると仮定している
    # なので「おおむね」動く

    res = SFN.describe_execution(executionArn=payload["executionArn"])

    return {"statusCode": 200, "body": res}
