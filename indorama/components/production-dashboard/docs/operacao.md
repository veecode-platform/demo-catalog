# Operação

## Deploy

GitLab CI → build Vite → S3 + invalidação CloudFront. Rollback = restaurar build anterior (artefatos versionados por commit SHA).

## Observabilidade

- **RUM:** Web Vitals coletados via Grafana Faro
- **Erros de frontend:** Sentry, projeto `production-dashboard`

## Runbook — incidentes comuns

### Telas de quiosque em branco na planta

1. Verificar expiração do device token (causa mais comum) — renovar via console de administração.
2. Confirmar conectividade da rede industrial com o CloudFront (proxy da planta).

### KPIs congelados

1. Checar status das APIs upstream (Supply Chain API / Logistics API) — o dashboard exibe a hora do último dado recebido no rodapé.
2. Se as APIs estão saudáveis, validar o WebSocket no painel *Connections* do Logistics Tracker.

## Contatos

Slack `#digital-products`
