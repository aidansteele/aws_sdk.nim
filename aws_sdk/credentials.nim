import times
import os
import strutils
import uri
import nre
import options
import tables

type AwsCredentials* = object
  accessKeyId*: string
  secretKey*: string
  token*: string
  
type AwsCredentialScope* = object
  time*: Time
  region*: string
  service*: string
  
proc initAwsCredentialsFromEnv*(): AwsCredentials =
  # from http://docs.aws.amazon.com/cli/latest/topic/config-vars.html#credentials
  result = AwsCredentials(
    accessKeyId: getEnv("AWS_ACCESS_KEY_ID"),
    secretKey: getEnv("AWS_SECRET_ACCESS_KEY"),
    token: getEnv("AWS_SESSION_TOKEN")
  )
  
proc `$`*(scope: AwsCredentialScope): string =
  let date = format(getGMTime(scope.time), "yyyyMMdd")
  result = "$1/$2/$3/aws4_request" % [date, scope.region, scope.service]

proc initCredentialScope*(uri: Uri, time: Time): AwsCredentialScope =
  let regex = re"(?<service>[^.]+)\.(?<region>[^.]+)?\.?amazonaws.com"
  let m = match(uri.hostname, regex)
  let table = toTable(get(m).captures)
  
  let service = table["service"]
  var region = table["region"]
  if isNil(region): region = "us-east-1"
  
  result = AwsCredentialScope(time: time, region: region, service: service)