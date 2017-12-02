import uri
import strtabs
import tables

type AwsRequest*[T] = object
  httpMethod*: string
  uri*: Uri
  headers*: T
  payloadHash*: string  
