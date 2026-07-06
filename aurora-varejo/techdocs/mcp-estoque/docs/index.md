# MCP Estoque

Agente MCP que expõe o sistema de estoque (WMS + ERP) para os assistentes de IA da Aurora Varejo. Toda consulta de saldo, reserva para retirada em loja e acompanhamento de transferências feita por agentes passa por aqui.

## Arquitetura

- **Transporte:** streamable-http, endpoint único atrás do gateway corporativo
- **Autenticação:** OAuth 2.1 client credentials — cada agente consumidor tem um client próprio; nenhuma credencial de sistema legado chega ao agente
- **Backends:** WMS (saldo em tempo real) e ERP (posição consolidada D-1)
- **Rate limit:** 50 req/s por client, com fila de burst

## Consumidores

| Consumidor | Uso |
|---|---|
| Assistente de atendimento | consulta de saldo e reserva para clientes |
| Agente de reposição | transferências entre lojas |

## Limites conhecidos

- Saldo consolidado da rede tem defasagem de até 15 minutos fora do horário comercial.
- Reservas expiram em 24h e não são renováveis via tool — renovação exige o fluxo humano no WMS.
