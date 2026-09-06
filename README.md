# OFMAPI Go SDK

**Status: planned, not yet published.** This module has no tagged release,
so `go get github.com/ofmapi/onlyfans-go` does not give you a client yet.

## Use OFMAPI from Go today

Generate a type-safe client from the public OpenAPI 3.1 spec with
oapi-codegen.

```bash
go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest
curl -sSL https://ofmapi.com/openapi.json -o openapi.json
oapi-codegen -package ofmapi -generate "types,client,std-http" -o ofmapi/client.gen.go openapi.json
```

```go
client, err := ofmapi.NewClientWithResponses(
    "https://api.ofmapi.com",
    ofmapi.WithRequestEditorFn(func(_ context.Context, req *http.Request) error {
        req.Header.Set("Authorization", "Bearer "+os.Getenv("OFMAPI_KEY"))
        return nil
    }),
)
```

Or run the script in this repository, which does the same thing:

```bash
./generate.sh
```

Full walkthrough: https://ofmapi.com/docs/sdk/go

Plain `net/http` works just as well:

```go
req, _ := http.NewRequest("GET", "https://api.ofmapi.com/v1/accounts", nil)
req.Header.Set("Authorization", "Bearer "+os.Getenv("OFMAPI_KEY"))
res, err := http.DefaultClient.Do(req)
```

## What OFMAPI is

A typed REST API over OnlyFans for agencies and developers, plus a hosted
MCP server (174 tools) for Claude, ChatGPT, Cursor, and VS Code. Free
during the public Beta; no card required; documented usage limits apply.

- Website: https://ofmapi.com
- Documentation: https://ofmapi.com/docs
- Interactive API reference (no login): https://ofmapi.com/docs/api
- OpenAPI spec: https://ofmapi.com/openapi.json
- Status: https://ofmapi.com/status

## Roadmap

This repository will hold the official SDK source when it is published.
Watch the repository or the changelog at https://ofmapi.com/changelog.

## License

MIT. See [LICENSE](LICENSE).

---

OFMAPI is an independent organisation, not affiliated with OnlyFans.com or
Fenix International Limited. "OnlyFans" is a registered trademark of Fenix
International Limited.
