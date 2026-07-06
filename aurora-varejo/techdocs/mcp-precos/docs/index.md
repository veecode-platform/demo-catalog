# MCP Preços

Agente MCP de precificação dinâmica. Expõe consulta de preço vigente, simulação de margem e campanhas ativas para os assistentes da Aurora Varejo.

## Arquitetura

- **Transporte:** streamable-http | **Auth:** OAuth 2.1 client credentials
- **Backend:** motor de precificação (demanda + concorrência), cache de 60s para consulta de preço vigente
- **Princípio de segurança:** nenhuma tool deste MCP **altera** preço. Alteração de preço é fluxo humano com alçada — agentes apenas consultam e simulam.

## Consumidores

Assistente de atendimento (preço vigente com campanhas) e agente de pricing (simulações em lote).
