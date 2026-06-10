# Arquitetura

## Visão de contexto

```mermaid
graph LR
    Kong[Kong API Gateway] -->|/supply-chain/v2| API[Supply Chain API]
    API --> PG[(PostgreSQL)]
    API -->|eventos| Kafka[(Kafka)]
    Kafka --> LT[Logistics Tracker]
    Kafka --> DL[Data Lake Ingestion]
    ERP[ERP Integration Service] -->|sincronização SAP| API
```

## Camadas

A aplicação segue arquitetura hexagonal:

- **`api/`** — controllers REST, validação de payload, mapeamento DTO
- **`domain/`** — entidades de negócio, regras de aprovação de pedidos, políticas de estoque
- **`infrastructure/`** — repositórios JPA, producers Kafka, clients HTTP para o SAP

## Decisões relevantes

| ADR | Decisão | Status |
|---|---|---|
| ADR-001 | PostgreSQL como fonte de verdade; SAP sincronizado via eventos | Aceita |
| ADR-004 | Outbox pattern para publicação confiável no Kafka | Aceita |
| ADR-007 | Idempotência por `Idempotency-Key` em todos os POSTs | Aceita |

## Fluxo de criação de pedido

```mermaid
sequenceDiagram
    participant C as Cliente (portal)
    participant K as Kong
    participant A as Supply Chain API
    participant DB as PostgreSQL
    participant KF as Kafka
    C->>K: POST /orders
    K->>A: valida JWT + rate limit
    A->>DB: persiste pedido + outbox
    A-->>C: 201 Created
    A->>KF: supply-chain.orders.created
```
