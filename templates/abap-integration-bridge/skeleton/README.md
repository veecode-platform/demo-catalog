# ${{ values.componentName }}

${{ values.description }}

REST front-door for ABAP/SAP integration. Downstream consumers call the bridge over JSON; the bridge translates to RFC and back.

## Local development

```bash
mvn spring-boot:run
```

The default `RFCAdapter` is a stub that returns synthetic responses — replace it with a real implementation backed by SAP JCo or your HTTP-based RFC gateway before pointing real traffic at it.

## Build

```bash
mvn -B verify
docker build -t ${{ values.componentName }}:local .
```

## SAP configuration

Override per environment via env vars:

| Env var | Purpose |
|---|---|
| `SAP_HOST` | ABAP application server host. |
| `SAP_SYSTEM_NUMBER` | Two-digit system number (e.g. `00`). |
| `SAP_SYSTEM` | System identifier (default: `${{ values.sapSystem }}`). |
| `SAP_CLIENT` | Client number (e.g. `100`). |
| `SAP_USER` | Service account user. |
| `SAP_PASSWORD` | Service account password. |

## Public contract

```
POST /bridge/{functionModule}
Content-Type: application/json

{ "params": { "key": "value" } }
```

Response is whatever the function module returns, normalized into JSON by the adapter.

## Layout

```
src/main/java/com/demo/app/
├── Application.java
├── rfc/                     RFC adapter interface + stub implementation
└── web/BridgeController.java
src/main/resources/application.yml
.github/workflows/ci.yml
Dockerfile
```
