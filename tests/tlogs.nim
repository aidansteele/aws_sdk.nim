import json, asyncdispatch
import ../aws_sdk/[ logs, credentials ]

let c = Logs.new(initAwsCredentialsFromEnv())
let j = waitFor c.describeLogGroups(newJObject())
echo "describeLogGroups returned ", j
