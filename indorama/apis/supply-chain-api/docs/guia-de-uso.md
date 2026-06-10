# Guia de Uso

## Autenticação

```bash
curl -X POST https://auth.indorama.com/oauth2/token \
  -d grant_type=client_credentials \
  -d client_id=$CLIENT_ID \
  -d client_secret=$CLIENT_SECRET \
  -d scope="orders:read"
```

Use o `access_token` retornado no header `Authorization: Bearer <token>`. Tokens expiram em 15 minutos.

## Exemplo — listar pedidos pendentes

```bash
curl https://api.indorama.com/supply-chain/v2/orders?status=PENDING \
  -H "Authorization: Bearer $TOKEN"
```

## Idempotência

Todos os `POST` aceitam o header `Idempotency-Key` (UUID). Reenvios com a mesma chave em até 24h retornam a resposta original — use sempre em integrações com retry.

## Erros

Erros seguem RFC 7807 (`application/problem+json`):

```json
{
  "type": "https://api.indorama.com/errors/order-not-found",
  "title": "Pedido não encontrado",
  "status": 404,
  "detail": "Pedido PO-2026-08841 não existe ou foi arquivado"
}
```

## Boas práticas

- Pagine com `page`/`pageSize` (máx. 200 por página).
- Prefira os eventos Kafka (`supply-chain.orders.*`) a polling para reagir a mudanças de status.
- Respeite o header `Retry-After` em respostas 429.
