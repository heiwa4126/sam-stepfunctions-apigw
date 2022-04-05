def lambda_handler(event, context):
    return {
        # "statusCode": 200,   # ApiGatewayじゃないのでstatusは不要
        "body": f'Hello {event["who"]}\n',
    }
