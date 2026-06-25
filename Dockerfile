# Multi-stage .NET 8 build → tiny aspnet runtime image.
# Build context expects: Program.cs, dotnet-sample.csproj at root.

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY dotnet-sample.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .

# Listen on the PORT env var (Railway sets this); fall back to 8080.
ENV ASPNETCORE_URLS=http://+:${PORT:-8080}
EXPOSE 8080

ENTRYPOINT ["dotnet", "dotnet-sample.dll"]
