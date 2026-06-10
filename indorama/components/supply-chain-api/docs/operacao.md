# Operação

## Deploy

Deploy contínuo via GitLab CI → ECS Fargate. Pipeline: `build → test → sonar → deploy-staging → smoke → deploy-prod` (aprovação manual no último estágio).

## Observabilidade

- **Dashboard Grafana:** [Supply Chain API — Overview](https://indorama-grafana.saas.vee.codes/d/supply-chain-api) (request rate, P95, error rate, pods ativos)
- **Logs:** CloudWatch, log group `/ecs/supply-chain-api`
- **Traces:** OpenTelemetry → Tempo, service name `supply-chain-api`

## SLOs

| Indicador | Objetivo | Janela |
|---|---|---|
| Disponibilidade | 99.9% | 30 dias |
| Latência P95 | < 300ms | 7 dias |
| Taxa de erro 5xx | < 0.1% | 7 dias |

## Runbook — incidentes comuns

### Latência alta (P95 > 300ms)

1. Verificar pool de conexões do PostgreSQL no dashboard (painel *DB Connections*).
2. Conferir se há lag nos consumers Kafka (`supply-chain.orders.*`).
3. Se a causa for volume, escalar via `desired count` no ECS (auto-scaling cobre até 8 tasks).

### Erros 502 no Kong

1. Confirmar health check: `GET /actuator/health` deve retornar `UP`.
2. Validar se o deploy mais recente passou no smoke test.
3. Rollback: re-deploy da tag anterior pelo pipeline (`Environments → production → Rollback`).

## Contatos

Plantão: PagerDuty `supply-chain-api-oncall` · Slack `#api-gateway`
