import times
import os
import strutils
import uri
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
  let components = split(uri.hostname, '.')
  let service = components[0]
  var region = ""
  if components.len == 4:
    region = components[1]
  elif components.len == 3:
    region = "us-east-1"

  result = AwsCredentialScope(time: time, region: region, service: service)
