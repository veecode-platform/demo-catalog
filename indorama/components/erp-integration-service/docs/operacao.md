# Operação

## Deploy

GitLab CI → ECS Fargate. Janela de deploy: **fora do batch financeiro (21h–23h BRT)**. Deploys nesse horário são bloqueados pelo pipeline.

## Observabilidade

- **Logs:** CloudWatch `/ecs/erp-integration-service`
- **Métricas-chave:** lag de IDocs pendentes, taxa de erro RFC, profundidade da DLQ

## Runbook — incidentes comuns

### IDocs acumulando (lag > 100)

1. Verificar conectividade RFC: painel *SAP RFC Health* no Grafana.
2. Se o SAP estiver em janela de manutenção, o acúmulo é esperado — o serviço drena automaticamente ao reconectar.
3. Caso contrário, reiniciar o listener: `aws ecs update-service --force-new-deployment`.

### Mensagens na DLQ (`erp.sync.dlq`)

1. Inspecionar a causa no header `x-error-cause` das mensagens.
2. Erros de dado mestre (material/fornecedor inexistente): acionar o time funcional SAP no `#sap-funcional`.
3. Após correção, reprocessar via endpoint interno `POST /admin/dlq/replay`.

### Batch financeiro falhou

1. **Não reexecutar manualmente sem validar** — risco de lançamento duplicado.
2. Conferir no staging quais lotes têm status `PENDING` vs `POSTED`.
3. Reexecução idempotente: `POST /admin/batch/financial/rerun` (usa controle de lote).

## Contatos

Plantão: PagerDuty `erp-integration-oncall` · Slack `#platform-eng`
