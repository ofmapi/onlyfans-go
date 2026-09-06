#!/usr/bin/env bash
# Generate a typed Go client for the OFMAPI OnlyFans API from the public
# OpenAPI 3.1 spec with oapi-codegen. Output lands in ./ofmapi (git-ignored).
#
#   ./generate.sh
#
# Walkthrough with usage examples: https://ofmapi.com/docs/sdk/go
set -euo pipefail

go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest
curl -sSfL https://ofmapi.com/openapi.json -o openapi.json
mkdir -p ofmapi
"$(go env GOPATH)/bin/oapi-codegen" \
  -package ofmapi \
  -generate "types,client,std-http" \
  -o ofmapi/client.gen.go \
  openapi.json

echo "generated ./ofmapi/client.gen.go — see https://ofmapi.com/docs/sdk/go for usage"
