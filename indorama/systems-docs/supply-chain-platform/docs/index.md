# Supply Chain Platform

Plataforma de gestão da cadeia de suprimentos: pedidos de compra, fornecedores, estoque e rastreabilidade de materiais.

## Componentes e APIs

- **Supply Chain API** — núcleo transacional da plataforma (expõe a API homônima via Kong)

## Diretrizes do sistema

- A Supply Chain API é a única fonte de escrita para pedidos e estoque na plataforma digital; o SAP é sincronizado por eventos.
- Consumidores novos entram sempre pela v2 via Kong, com consumer dedicado e escopos mínimos.
- Mudanças de contrato seguem o processo de versionamento documentado no TechDocs da API.

**Owner:** API & Gateway Team — `#api-gateway`
