# Supply Chain API — v2

API de gestão da cadeia de suprimentos: pedidos de compra, fornecedores, estoque e rastreamento de materiais.

O contrato OpenAPI completo (endpoints, schemas e exemplos) está na aba **Definition** desta entidade.

## Informações gerais

| | |
|---|---|
| **Base URL** | `https://api.indorama.com/supply-chain/v2` |
| **Gateway** | Kong — rate limit de 1000 req/min por consumer |
| **Autenticação** | OAuth2 client credentials (OIDC corporativo) |
| **Versão atual** | 2.0.0 |
| **Suporte** | API & Gateway Team — `#api-gateway` |

## Versionamento

- Versões major na URL (`/v2`); minor/patch são retrocompatíveis.
- Campos deprecados são anunciados com 6 meses de antecedência via header `Sunset` e changelog no canal `#api-announcements`.
- A v1 está em sunset — desligamento programado, novos consumers devem usar a v2.

## Como obter acesso

1. Solicitar um consumer no Kong via template **Expose API via Kong Gateway** no portal (Self-service → Create).
2. O time de gateway aprova e provisiona as credenciais OAuth2 no cofre.
3. Escopos disponíveis: `orders:read`, `orders:write`, `suppliers:read`, `inventory:read`.
