# Logistics Tracker

Rastreamento em tempo real de cargas e transporte, integrado com transportadoras parceiras. Alimenta o portal de clientes e o Production Dashboard com posição e ETA de cada embarque.

## Funcionalidades

- Posição de veículos em tempo real (webhooks + polling das transportadoras)
- Cálculo de ETA com ajuste por histórico de rota
- Alertas de atraso e desvio de rota via WebSocket
- Timeline de eventos por embarque (coleta, trânsito, entrega, ocorrências)

## Stack

- **Linguagem:** Node.js 22 + TypeScript + Fastify
- **Tempo real:** WebSocket (socket.io) para o frontend
- **Cache/geo:** Redis (posições atuais, geofencing)
- **Persistência:** PostgreSQL (histórico de eventos)
- **Gateway:** Kong (rota `/logistics/v1`)

## Integrações com transportadoras

| Transportadora | Método | Latência típica |
|---|---|---|
| Parceiros tier-1 | Webhook assinado | < 30s |
| Parceiros tier-2 | Polling REST | 5 min |
| Spot / avulsos | EDI via SFTP | 1h |

## Time responsável

**Digital Products** — canal `#digital-products` no Slack.
