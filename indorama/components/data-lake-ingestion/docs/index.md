# Data Lake Ingestion

Pipelines de ingestão de dados industriais para o data lake — sensores IoT das plantas, eventos do ERP e extrações de sistemas legados. Base para analytics, relatórios regulatórios e modelos de ML (previsão de demanda, manutenção preditiva).

## Fontes de dados

| Fonte | Mecanismo | Volume | Latência |
|---|---|---|---|
| Sensores IoT (plantas) | MQTT → Kafka | ~2M eventos/dia | Streaming |
| Eventos ERP | Kafka (`erp.sync.*`) | ~50k eventos/dia | Streaming |
| Sistemas legados | Extração JDBC agendada | 12 tabelas | Batch diário |
| Laudos de qualidade | Kafka (`qc.*`) | ~5k eventos/dia | Streaming |

## Stack

- **Orquestração:** Apache Airflow 2.9 (DAGs versionadas neste repositório)
- **Processamento:** Spark 3.5 em EMR Serverless
- **Armazenamento:** S3 em camadas bronze/silver/gold (formato Delta Lake)
- **Catálogo de dados:** Glue Data Catalog + Athena para consumo ad-hoc

## Time responsável

**Data Services** — canal `#data-services` no Slack.
