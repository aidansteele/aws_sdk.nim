
AWS_SDK_GO_ROOT=$1

MODELS="$AWS_SDK_GO_ROOT/models/apis"
OUT=../../aws_sdk

nim c generator.nim
./generator "$MODELS/dynamodb/2012-08-10/api-2.json" DynamoDB "$OUT/dynamodb.nim"
./generator "$MODELS/logs/2014-03-28/api-2.json" Logs "$OUT/logs.nim"
./generator "$MODELS/firehose/2015-08-04/api-2.json" Firehose "$OUT/firehose.nim"
