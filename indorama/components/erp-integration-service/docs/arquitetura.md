# Arquitetura

## Visão de contexto

```mermaid
graph LR
    SAP[SAP ECC] -->|IDoc / RFC| ERP[ERP Integration Service]
    ERP -->|REST| SCA[Supply Chain API]
    ERP -->|eventos| Kafka[(Kafka)]
    ERP --> PG[(PostgreSQL staging)]
    Kafka --> DL[Data Lake Ingestion]
```

## Padrões de integração

- **Inbound (SAP → plataforma):** IDocs recebidos via tRFC, convertidos para eventos canônicos e publicados no Kafka. O staging em PostgreSQL guarda o payload bruto para reconciliação.
- **Outbound (plataforma → SAP):** chamadas BAPI via JCo com retry exponencial e circuit breaker (Resilience4j). Falhas vão para a fila `erp.sync.dlq` com alerta automático.

## Reconciliação

Job diário (4h BRT) compara totais de pedidos e movimentos de estoque entre o staging e o SAP. Divergências geram relatório no canal `#erp-reconciliation` e ficam visíveis no dashboard Grafana.

```mermaid
sequenceDiagram
    participant SAP as SAP ECC
    participant ERP as ERP Integration
    participant K as Kafka
    SAP->>ERP: IDoc ORDERS05 (tRFC)
    ERP->>ERP: valida + converte p/ evento canônico
    ERP->>K: erp.sync.orders
    ERP-->>SAP: ACK tRFC
    Note over ERP: payload bruto persistido p/ reconciliação
```
