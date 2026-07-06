# Tools

Contrato completo (schemas) na aba **API** da entidade [`mcp-estoque-tools`](https://aurora.saas.vee.codes/catalog/default/api/mcp-estoque-tools).

## consultar_estoque

Consulta saldo por SKU, opcionalmente filtrado por loja. Sem `loja`, retorna o consolidado da rede (defasagem de até 15 min).

**Boas práticas para prompts de agente:** sempre informar a loja quando o contexto do cliente a tiver — o consolidado não serve para prometer retirada.

## reservar_estoque

Reserva quantidade para retirada em loja. Idempotente por `(cliente_id, sku, loja)` numa janela de 5 minutos — retries do agente não duplicam reserva.

## consultar_transferencias

Lista transferências em trânsito. Usada pelo agente de reposição; leitura pura, sem efeitos colaterais.
