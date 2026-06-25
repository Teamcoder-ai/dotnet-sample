// Minimal ASP.NET Core hello-world for Splicer's multi-stack vibe-coding tests.
// Listens on the PORT env var (Railway/Heroku-style) or falls back to 8080.
//
// GET /         → 200 "Hello from dotnet-sample!"
// GET /health   → 200 OK (health check endpoint for autoFix verification)

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var port = Environment.GetEnvironmentVariable("PORT") ?? "8080";
app.Urls.Add($"http://0.0.0.0:{port}");

app.MapGet("/", () => "Hello from dotnet-sample!");
app.MapGet("/health", () => Results.Ok(new { status = "ok" }));

app.Run();
