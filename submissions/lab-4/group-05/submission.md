# Lab 4 Submission

## About us

- Group number: 5
- Section: IV-BCSAD
- Group IAM user: bcsad-g05
- DynamoDB table name: umak-elec3-bcsad-g05-messages
- HTTP API name: umak-elec3-bcsad-g05-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 5 of IV-BCSAD"
TABLE_NAME = "umak-elec3-bcsad-g05-messages"

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

   API Gateway puts the route that matched the request into the event, in the field `routeKey`. For example it is `"GET /messages"` for a GET request and `"POST /messages"` for a POST request. The handler reads `event.get("routeKey")` and uses `if` checks to run the GET code or the POST code. Any other value gets the 404 answer.

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   The answer is `{"message":"Not Found"}`. API Gateway answers by itself because our API has only two routes, `GET /messages` and `POST /messages`, and no route matches the path `/`. When no route matches, API Gateway returns Not Found and never calls the Lambda function. Our function's own 404 answer (`No route for ...`) only runs when a request has already matched a route that is connected to the function.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   The cost of each GET request grows with the table. Scan reads every item in the table, and DynamoDB charges for the amount of data that it reads (read capacity units). With three items, our scan consumed 2 RCUs. With thousands of messages, each GET would read all of them and cost much more, and it would also get slower. One Scan call returns at most 1 MB of data, so a very large table would also need extra calls to read all the items. A Query on a key, or a limit on the results, would read only the items that we need.
