import json, asyncdispatch
import ../aws_sdk/[ firehose, credentials ]

let c = Firehose.new(initAwsCredentialsFromEnv())
let j = waitFor c.listDeliveryStreams(newJObject())
echo "listDeliveryStreams returned ", j
