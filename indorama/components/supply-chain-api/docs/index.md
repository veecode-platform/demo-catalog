# Supply Chain API

API REST de gestão da cadeia de suprimentos — pedidos de compra, fornecedores, estoque e rastreamento de materiais.

## Responsabilidades

| Domínio | Descrição |
|---|---|
| Pedidos | Ciclo de vida completo de pedidos de compra (criação, aprovação, recebimento) |
| Fornecedores | Cadastro, homologação e avaliação de fornecedores |
| Estoque | Posição de estoque por planta e material |
| Rastreamento | Rastreabilidade de lotes da matéria-prima ao produto acabado |

## Stack

- **Linguagem:** Java 21 + Spring Boot 3.3
- **Banco de dados:** PostgreSQL 16 (RDS)
- **Mensageria:** Kafka — tópicos `supply-chain.orders.*`
- **Gateway:** Kong (rota `/supply-chain/v2`, autenticação via OIDC)

## Consumidores

Esta API é consumida pelo [Logistics Tracker](https://indorama.saas.vee.codes/catalog/default/component/logistics-tracker), pelo [Production Dashboard](https://indorama.saas.vee.codes/catalog/default/component/production-dashboard) e pelos pipelines de ingestão do Data Lake.

## Contrato

O contrato OpenAPI 3.0 versionado está disponível na aba **API** desta entidade. Mudanças de contrato seguem o processo de versionamento semântico — breaking changes exigem nova versão major publicada no Kong.

## Time responsável

**API & Gateway Team** — canal `#api-gateway` no Slack. Plantão via PagerDuty, escala `supply-chain-api-oncall`.
