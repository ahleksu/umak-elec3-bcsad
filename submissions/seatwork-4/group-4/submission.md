# Seatwork 4 Submission

## About us

- Group number: 4
- Section: IV-BCSAD
- Group IAM user: bcsad-g04
- Function name: umak-elec3-bcsad-g04-api

## Handler code

```python
import json

GROUP_NAME = "Group 4 of IV-BCSAD"


def lambda_handler(event, context):
    visitor = event.get("name", "visitor")
    body = {
        "message": f"Hello, {visitor}! Greetings from {GROUP_NAME}.",
        "group": GROUP_NAME,
    }
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


REPORT lines
First run, a cold start:
REPORT RequestId: a31ae7ba-1304-4887-bf55-f48cc9fcdc58 Duration: 2.00 ms Billed Duration: 87 ms Memory Size: 128 MB Max Memory Used: 32 MB Init Duration: 84.73 ms

Second run, a warm start:
REPORT RequestId: 8feaa970-d406-4f0a-af9f-b7749392f39c Duration: 2.73 ms Billed Duration: 3 ms Memory Size: 128 MB Max Memory Used: 32 MB

Question
Why does the second REPORT line have no Init Duration?

The first run was a cold start, so AWS Lambda had to initialize a new execution environment, start the Python 3.13 runtime, and load the handler code (recorded as Init Duration). Lambda keeps that execution environment warm for subsequent invocations, so the second run reused it without repeating initialization.

## Screenshots
Code tab with our deployed handler - code.png 
Test result with Executing function: succeeded test.png
The two REPORT lines in CloudWatch - report.png


## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| leksxee | Created the Lambda function and configured the execution role |
| angeluuhh | Deployed the handler code, ran the test event twice, and captured screenshots |
| ctrl-amed/jajaalbaladejo27-sys | Retrieved the CloudWatch REPORT lines, completed submission.md, and opened the PR |
