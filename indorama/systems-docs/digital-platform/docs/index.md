# Digital Platform

Plataforma de produtos digitais e experiência do cliente: portais web, rastreamento de cargas e APIs de logística.

## Componentes e APIs

- **Logistics Tracker** — rastreamento em tempo real (expõe a Logistics API)
- **Production Dashboard** — portal de KPIs industriais e acompanhamento de produção

## Diretrizes do sistema

- Frontends consomem APIs exclusivamente via Kong (nunca serviço-a-serviço direto).
- Dados em tempo real via WebSocket do Logistics Tracker; demais dados via REST com cache no cliente.
- Design system `@indorama/ui` é obrigatório para novos frontends.

**Owner:** Digital Products — `#digital-products`
