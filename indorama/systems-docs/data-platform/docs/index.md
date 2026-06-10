# Data Platform

Plataforma de dados, analytics e machine learning: data lake industrial, qualidade de dados e serviços analíticos.

## Componentes

- **Data Lake Ingestion** — pipelines de ingestão (IoT, ERP, legados) para o lake em camadas bronze/silver/gold
- **Quality Control Service** — laudos, inspeções e conformidade regulatória

## Diretrizes do sistema

- Todo dado entra no lake pela camada bronze via pipelines versionados — sem cargas manuais.
- Schemas registrados no Schema Registry são contrato obrigatório entre produtores e o lake.
- Dados regulatórios (laudos, trilhas de auditoria) têm retenção mínima de 10 anos.

**Owner:** Data Services — `#data-services`
