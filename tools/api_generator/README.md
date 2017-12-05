Generating Nim bindings to AWS API
=====================

The generator uses AWS API Json definitions, which can be found in
[aws-sdk-go](https://github.com/aws/aws-sdk-go) repo.

```sh
git clone https://github.com/aws/aws-sdk-go
export AWS_SDK_GO_ROOT=$(pwd)/aws-sdk-go

cd aws_sdk.nim/tools/api/generator
sh gen.sh "$AWS_SDK_GO_ROOT"
```
