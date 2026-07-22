# dotnet-sample

Minimal ASP.NET Core 8 hello-world used by TeamCoder's multi-stack vibe-coding
ITs (`ClaudeApiRealRailwayIT`) to verify Railway deploy + autoFix for the
.NET stack. Sibling to `flask-sample`, `node-express-sample`, `go-gin-sample`.

## Routes

- `GET /` — 200, `"Hello from dotnet-sample!"`
- `GET /health` — 200, JSON `{ "status": "ok" }`

## Build & run

```bash
docker build -t dotnet-sample .
docker run -p 8080:8080 dotnet-sample
curl http://localhost:8080/
```

## Why this repo exists

TeamCoder's IT generates a deploy prompt that references a hardcoded ECR image URL.
Each rotated stack has its own dedicated sample repo so the Claude-derived
Railway project name (which mirrors the repo name) doesn't collide across stacks.
