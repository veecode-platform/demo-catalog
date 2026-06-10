# Operação

## Deploy

GitLab CI → ECS Fargate. Migrações de banco via Alembic executadas em job dedicado antes do rollout.

## Observabilidade

- **Métricas-chave:** laudos pendentes de aprovação, tempo médio análise→liberação, falhas de geração de CoA
- **Logs:** CloudWatch `/ecs/quality-control-service`

## Runbook — incidentes comuns

### Expedição bloqueada por laudos pendentes

1. Verificar se há acúmulo na fila de integração com o LIMS (painel *LIMS Sync*).
2. Se o LIMS estiver fora, resultados podem ser lançados manualmente por usuário com papel `qc-analyst` (procedimento POP-QC-012).
3. **Nunca** liberar lote por banco de dados — a liberação exige assinatura digital registrada.

### Falha na geração de CoA (PDF)

1. Conferir DLQ `qc.coa.failed` — causa comum é template desatualizado após mudança de especificação.
2. Reprocessar via `POST /admin/coa/regenerate` após correção.

## Conformidade

Trilha de auditoria exportável por período via `GET /audit/export`. Acesso restrito ao papel `qc-auditor`; toda exportação é registrada.

## Contatos

Plantão: PagerDuty `qc-service-oncall` · Slack `#data-services`
