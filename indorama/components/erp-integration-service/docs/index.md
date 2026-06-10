# ERP Integration Service

Serviço de integração com o SAP ERP — sincronização bidirecional de pedidos, posições de estoque e lançamentos financeiros entre o SAP ECC e a plataforma digital.

!!! warning "Serviço crítico"
    Este serviço é classificado como **tier-1**. Indisponibilidade acima de 15 minutos impacta faturamento e expedição nas plantas. Siga o [runbook](operacao.md) antes de qualquer intervenção manual.

## Responsabilidades

| Integração | Direção | Frequência |
|---|---|---|
| Pedidos de compra (ME21N) | SAP → Plataforma | Near real-time (IDoc) |
| Posição de estoque (MB52) | SAP → Plataforma | A cada 15 min |
| Recebimento de materiais | Plataforma → SAP | Near real-time |
| Lançamentos financeiros | Plataforma → SAP | Batch diário (22h BRT) |

## Stack

- **Linguagem:** Java 21 + Spring Boot 3.3 + Spring Integration
- **Conectividade SAP:** SAP JCo 3.1 (RFC) + processamento de IDocs
- **Mensageria:** Kafka — tópicos `erp.sync.*`
- **Persistência:** PostgreSQL (staging de reconciliação)

## Time responsável

**Platform Engineering** — canal `#platform-eng` no Slack. Plantão PagerDuty, escala `erp-integration-oncall`.
