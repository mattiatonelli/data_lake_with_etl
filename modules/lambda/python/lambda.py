def lambda_handler(event=None, context=None):
    """
    Lambda function handler.
    Args:
        event (dict): Event data passed to the lambda function.
        context (LambdaContext): Runtime information provided by AWS Lambda.
    Returns:
        dict: Response with experiments data.
    """
    print("Hello World!")