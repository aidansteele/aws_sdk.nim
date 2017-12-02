import json, asyncdispatch
import ../aws_sdk/[ dynamodb, credentials ]

let c = DynamoDB.new(initAwsCredentialsFromEnv())
let j = waitFor c.listTables(newJObject())
echo "listTables returned ", j
