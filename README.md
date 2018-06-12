# aws_sdk [![Build Status](https://travis-ci.org/aidansteele/aws_sdk.nim.svg?branch=master)](https://travis-ci.org/aidansteele/aws_sdk.nim)

`aws_sdk` is a Nim library for interacting with [Amazon Web Services][aws].

[aws]: https://aws.amazon.com/

## Current status

`aws_sdk` is still a very much work in progress. Right now it is just the
bare essentials: request signing. All AWS operations require authenticated
HTTP calls - this library calculates the necessary header values.

It is planned to incorporate a library of functions that cover all the services
provided by AWS - making the most of Nim's rich type-system and language
features.

## Usage

```nim
import aws_sdk/credentials
import aws_sdk/request
import aws_sdk/http

let payload = ""
let payloadHash = sphHash[SHA256](payload)
# special header required by S3
let headers = toTable({ "x-amz-content-sha256": hexify(payloadHash) })

# T in AwsRequest[T] can also be a StringTableRef
let req = AwsRequest[Table[string, string]](
  httpMethod: "GET",
  uri: parseUri("https://s3.amazonaws.com/"),
  headers: headers,
  payloadHash: payloadHash
)

# initAwsCredentialsFromEnv(): AwsCredentials is also available
let credentials = AwsCredentials(
  accessKeyId: "AKIDEXAMPLE",
  secretKey: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY"
)

let resp = request(req, creds)
echo resp # <?xml version="1.0" encoding="UTF-8"?><ListAllMyBucketsResult xmlns="http://s3...
```

