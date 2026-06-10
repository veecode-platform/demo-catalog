# ERP Ecosystem

Sistema que agrupa as integrações com o SAP ECC e os processos de back-office: sincronização de pedidos, estoque, financeiro e dados mestres.

## Componentes

- **ERP Integration Service** — ponte SAP ↔ plataforma digital (IDocs, RFC, batch financeiro)

## Diretrizes do sistema

- Toda comunicação com o SAP passa pelo ERP Integration Service — nenhum outro serviço fala RFC diretamente.
- Eventos canônicos publicados em `erp.sync.*` são o contrato para o restante da plataforma.
- Janela de batch financeiro (21h–23h BRT) é protegida: sem deploys nem manutenções.

**Owner:** Platform Engineering — `#platform-eng`
