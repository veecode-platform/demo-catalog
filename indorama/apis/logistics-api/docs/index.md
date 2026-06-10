# Logistics API — v1

API de rastreamento logístico: embarques, posição de cargas em tempo real e ETA.

O contrato OpenAPI completo está na aba **Definition** desta entidade.

## Informações gerais

| | |
|---|---|
| **Base URL** | `https://api.indorama.com/logistics/v1` |
| **Gateway** | Kong — rate limit de 600 req/min por consumer |
| **Autenticação** | OAuth2 client credentials (OIDC corporativo) |
| **Tempo real** | WebSocket em `wss://api.indorama.com/logistics/v1/ws` |
| **Suporte** | Digital Products — `#digital-products` |

## Modelo de dados

- **Shipment** — embarque com origem, destino, transportadora e janela de entrega
- **Position** — última posição conhecida (lat/lon, timestamp, fonte)
- **Event** — timeline do embarque (coleta, trânsito, ocorrência, entrega)

## Como obter acesso

Mesmo fluxo da Supply Chain API: solicitar consumer via template **Expose API via Kong Gateway** no portal. Escopos: `shipments:read`, `tracking:read`.
