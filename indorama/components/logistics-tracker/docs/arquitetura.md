# Arquitetura

## Visão de contexto

```mermaid
graph LR
    TR[Transportadoras] -->|webhooks / polling| LT[Logistics Tracker]
    LT --> Redis[(Redis — posições)]
    LT --> PG[(PostgreSQL — eventos)]
    LT -->|consulta pedidos| SCA[Supply Chain API]
    LT -->|WebSocket| FE[Production Dashboard / Portal]
```

## Fluxo de atualização de posição

```mermaid
sequenceDiagram
    participant T as Transportadora
    participant LT as Logistics Tracker
    participant R as Redis
    participant WS as Clientes WebSocket
    T->>LT: webhook posição (assinado HMAC)
    LT->>LT: valida assinatura + dedup
    LT->>R: GEOADD posição atual
    LT->>WS: push p/ rooms inscritas no embarque
```

## Decisões relevantes

- **Redis como fonte de leitura quente:** o frontend nunca consulta PostgreSQL para posição atual; o histórico fica no Postgres para auditoria e analytics.
- **Dedup por `(carrier, shipmentId, timestamp)`:** transportadoras tier-2 reenviam posições no polling; eventos duplicados são descartados antes do fan-out.
- **Backpressure no WebSocket:** atualizações são agregadas em janelas de 5s por embarque para não saturar clientes móveis.
