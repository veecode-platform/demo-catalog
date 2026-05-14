# ABAP Integration Bridge — Java Service

Spring Boot 3 service that fronts an ABAP backend with a clean REST API. Intended for modernizing legacy SAP/ABAP integrations: downstream services keep talking REST/JSON; the bridge owns the protocol translation, error mapping, and connection pooling.

Use when:
- You have an existing ABAP system that's not going away.
- Multiple services need to call into it and you don't want N implementations of the SAP/ABAP plumbing.
- You want one place to add retries, circuit breakers, observability, and contract versioning around the legacy boundary.

Pick `java-microservice-basic` if there's no ABAP/SAP involvement. Pick `java-microservice-with-postgres` if the bridge needs its own state (e.g., correlation tables, outbox patterns).

## What you get

- Spring Boot 3.3 on Java 21 (Maven)
- `RFCAdapter` interface + stub implementation under `com.demo.app.rfc` (replace with real SAP JCo or HTTP-based RFC client)
- Configurable connection properties under `app.sap.*` in `application.yml` (host, system number, client, user, password — all env-overridable)
- `BridgeController` exposing `POST /bridge/{functionModule}` as the public REST shape
- Multi-stage Dockerfile, `/actuator/health` with a custom `SapHealthIndicator` placeholder
- GitHub Actions CI

## Parameters

| Name | Required | Notes |
|---|---|---|
| `componentName` | yes | kebab-case (e.g. `sankhya-abap-bridge`). |
| `description` | yes | One-line summary. |
| `owner` | yes | Owning team. |
| `repoUrl` | yes | GitHub destination. |
| `sapSystem` | no | Default system identifier baked into config. Override via env at deploy time. |

## Tags

`sankhya-demo`, `java`, `microservice`, `spring-boot`, `abap`, `sap`, `integration`, `legacy`
