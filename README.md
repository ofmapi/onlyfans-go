# OnlyFans API for Go (OFMAPI)

Use the OFMAPI OnlyFans API from Go: fans and subscribers, messages and
PPV, posts and the vault, earnings and statistics, plus signed webhooks.
Generate a typed client from the OpenAPI 3.1 spec with oapi-codegen, or call
the REST endpoints with `net/http`.

**Status: official SDK planned, not yet published.** This module has no
tagged release, so `go get github.com/ofmapi/onlyfans-go` does not give you
a client yet.

## Generate a typed OnlyFans API client

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

## Plain `net/http` works just as well

```go
req, _ := http.NewRequest("GET", "https://api.ofmapi.com/v1/accounts", nil)
req.Header.Set("Authorization", "Bearer "+os.Getenv("OFMAPI_KEY"))
res, err := http.DefaultClient.Do(req)
```

Get an API key at https://app.ofmapi.com/api-keys (free during the public
Beta, no card required), connect an OnlyFans account in the dashboard, and
the account appears in that list.

## What OFMAPI is

An independent, unofficial OnlyFans API for agencies and developers: typed
REST endpoints, signed webhooks, and a hosted MCP server (174 tools) for
Claude, ChatGPT, Cursor, and VS Code. There is no official OnlyFans
developer API.

- Website: https://ofmapi.com
- Documentation: https://ofmapi.com/docs
- Interactive API reference (no login): https://ofmapi.com/docs/api
- OpenAPI spec: https://ofmapi.com/openapi.json
- Code examples (standard-library webhook receiver in Go): https://github.com/ofmapi/examples
- Status: https://ofmapi.com/status
- Contact and support: https://ofmapi.com/contact

## Roadmap

This repository will hold the official SDK source when it is published.
Watch the repository or the changelog at https://ofmapi.com/changelog.

## License

MIT. See [LICENSE](LICENSE).

---

OFMAPI is an independent organisation, not affiliated with OnlyFans.com or
Fenix International Limited. "OnlyFans" is a registered trademark of Fenix
International Limited.
