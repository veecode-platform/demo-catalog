# Production Dashboard

Portal web de acompanhamento de produção em tempo real — KPIs industriais, status de linhas de produção e alertas operacionais para as plantas.

## Principais telas

| Tela | Conteúdo | Público |
|---|---|---|
| Visão da planta | OEE, disponibilidade e performance por linha | Gerência de planta |
| Embarques | Posição e ETA das cargas (via Logistics Tracker) | Logística |
| Qualidade | Lotes pendentes de laudo e bloqueios de expedição | Qualidade / PCP |
| Alertas | Ocorrências operacionais com acknowledgment | Turno de operação |

## Stack

- **Frontend:** React 18 + TypeScript + Vite
- **Estado/dados:** TanStack Query + WebSocket (dados em tempo real do Logistics Tracker)
- **Design system:** biblioteca interna `@indorama/ui` (tokens compartilhados com o portal de clientes)
- **Hospedagem:** S3 + CloudFront

## APIs consumidas

- [Supply Chain API](https://indorama.saas.vee.codes/catalog/default/api/supply-chain-api) — pedidos e estoque
- [Logistics API](https://indorama.saas.vee.codes/catalog/default/api/logistics-api) — posição de embarques

## Time responsável

**Digital Products** — canal `#digital-products` no Slack.
