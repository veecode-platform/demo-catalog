# Java Microservice — Basic

Production-ready Spring Boot 3 service starter. Stateless by default — no database, no persistence layer. Use this for services that hold no state of their own: stateless APIs, message consumers, request orchestrators, integrations that just shuttle data.

If you need a database, pick `java-microservice-with-postgres` instead.

## What you get

- Spring Boot 3.3 on Java 21 (Maven)
- Multi-stage Dockerfile (eclipse-temurin)
- `/actuator/health` and `/actuator/info` exposed
- GitHub Actions CI: build, test, container image
- Backstage `catalog-info.yaml` pre-filled

## Parameters

| Name | Required | Notes |
|---|---|---|
| `componentName` | yes | kebab-case (e.g. `payments-api`). Becomes the repo, artifact, and Backstage component name. |
| `description` | yes | One-line summary; lands in `catalog-info.yaml` and README. |
| `owner` | yes | Owning team (`group:default/payroll`, `user:default/alice`, etc.). |
| `repoUrl` | yes | Target GitHub location, e.g. `github.com?owner=acme&repo=payments-api`. |

## Tags

`sankhya-demo`, `java`, `microservice`, `spring-boot`, `maven`
