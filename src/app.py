def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": f'Hello {event["who"]}\n',
    }
