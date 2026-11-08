# Lab 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save routes.png, post.png, get.png, and items.png in the same folder.
4. Crop the AWS console top bar out of routes.png and items.png, and cover every ARN.
5. Cover your API ID, the part between https:// and .execute-api, in routes.png, post.png, and get.png. Your invoke URL goes only in the Google Form, never in this repository.
6. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 9
- Section: IV-BCSAD
- Group IAM user: bcsad-g09
- DynamoDB table name: umak-elec3-bcsad-g09-messages
- HTTP API name: umak-elec3-bcsad-g09-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 9 of IV-BCSAD"
TABLE_NAME = "umak-elec3-bcsad-g09-messages"

table = boto3.resource("dynamodb").Table(TABLE_NAME)


def respond(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


def read_json_body(event):
    body = event.get("body") or "{}"
    if event.get("isBase64Encoded"):
        body = base64.b64decode(body).decode("utf-8")
    return json.loads(body)


def lambda_handler(event, context):
    route = event.get("routeKey")

    if route == "GET /messages":
        items = table.scan()["Items"]
        return respond(200, items)

    if route == "POST /messages":
        try:
            data = read_json_body(event)
        except ValueError:
            data = None
        if not isinstance(data, dict) or not data.get("text"):
            return respond(400, {"error": "Send a JSON body with a text field."})
        if len(str(data["text"])) > 280:
            return respond(400, {"error": "Keep the text at 280 characters or fewer."})
        message = {
            "id": str(uuid.uuid4()),
            "author": str(data.get("author") or GROUP_NAME)[:80],
            "text": str(data["text"]),
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }
        table.put_item(Item=message)
        return respond(201, message)

    return respond(404, {"error": f"No route for {route}"})
```

## Screenshots

![The Routes page with GET /messages and POST /messages](routes.png)

![Our curl POST commands and the answers](post.png)

![Our messages in the browser](get.png)

![The items in our DynamoDB table](items.png)

## Questions

1. Both routes call the same function. How does your code know which route a request came through?

   API Gateway passes the matched HTTP method and path inside the payload format 2.0 `event` dictionary under the `"routeKey"` field, which our code reads with `route = event.get("routeKey")`. The handler then branches on `if route == "GET /messages":` (to scan the DynamoDB table and return all messages) and `if route == "POST /messages":` (to validate the JSON request body and store a new message item).

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   Opening the invoke URL without `/messages` returns `{"message":"Not Found"}` (HTTP 404). API Gateway returns this response directly without invoking our Lambda function because our HTTP API only has routes defined for `GET /messages` and `POST /messages` (and no root `GET /` or `$default` catch-all route), so API Gateway rejects unmatched paths before any Lambda integration is called.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   As the table grows to thousands of messages, the DynamoDB cost (and response time) of every `GET /messages` request increases linearly with the total data size of the table. Because `table.scan()` reads every item in the entire table on each call—and DynamoDB on-demand charges read request units based on the total bytes scanned (0.5 RRU per 4 KB for eventually consistent reads)—each single `GET /messages` request consumes proportionally more read request units as more items accumulate in the table.

