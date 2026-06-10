# Operação

## Deploy

DAGs sincronizadas do repositório para o Airflow via GitLab CI (git-sync). Jobs Spark empacotados como imagens OCI versionadas.

## Observabilidade

- **Airflow UI:** estado das DAGs, SLA misses e duração por task
- **Métricas-chave:** lag de consumo Kafka, freshness por tabela silver/gold, mensagens em quarentena

## Runbook — incidentes comuns

### Tabela gold desatualizada (freshness > SLA)

1. Identificar na lineage qual DAG upstream falhou (Airflow → *Browse → DAG Dependencies*).
2. Falha em extração legada geralmente é janela de manutenção do sistema fonte — reexecutar a task após a janela.
3. Reprocessamento: `airflow dags trigger <dag_id> --conf '{"start": "...", "end": "..."}'` (idempotente).

### Mensagens em quarentena crescendo

1. Comparar o schema da mensagem rejeitada com a versão no registry — causa típica é produtor que publicou mudança sem registrar.
2. Acionar o time produtor; após registro do schema, reprocessar a quarentena pela DAG `quarantine_replay`.

## Contatos

Slack `#data-services`
