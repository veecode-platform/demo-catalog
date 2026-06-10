# Guia de Uso

## Consultar posição de um embarque

```bash
curl https://api.indorama.com/logistics/v1/shipments/SH-2026-44120/position \
  -H "Authorization: Bearer $TOKEN"
```

```json
{
  "shipmentId": "SH-2026-44120",
  "lat": -23.4912,
  "lon": -46.8264,
  "speedKmh": 78,
  "recordedAt": "2026-06-10T14:32:11Z",
  "source": "carrier-webhook",
  "etaDestination": "2026-06-10T19:45:00Z"
}
```

## Tempo real via WebSocket

Inscreva-se nos embarques de interesse após conectar:

```json
{ "action": "subscribe", "shipmentIds": ["SH-2026-44120"] }
```

Atualizações chegam agregadas em janelas de 5 segundos por embarque. Reconexões devem reenviar as inscrições.

## Boas práticas

- Para acompanhar poucos embarques, prefira WebSocket; para cargas em lote (relatórios), use `GET /shipments?updatedSince=`.
- `ETA` é recalculado a cada nova posição — não cacheie por mais de 5 minutos.
- Ocorrências (avaria, atraso, sinistro) chegam como `Event` com `severity`; trate `severity >= HIGH` com alerta.
