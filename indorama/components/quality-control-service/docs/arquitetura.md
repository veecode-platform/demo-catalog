# Arquitetura

## Visão de contexto

```mermaid
graph LR
    LIMS[LIMS Laboratório] -->|resultados| QC[Quality Control Service]
    QC --> PG[(PostgreSQL)]
    QC --> S3[(S3 — CoA / retenção 10 anos)]
    QC -->|status de lote| SCA[Supply Chain API]
    QC -->|eventos| Kafka[(Kafka)]
```

## Workflow de aprovação de laudo

```mermaid
stateDiagram-v2
    [*] --> EmAnalise: resultados recebidos do LIMS
    EmAnalise --> AguardandoAprovacao: análises completas
    AguardandoAprovacao --> Aprovado: 2ª assinatura (químico responsável)
    AguardandoAprovacao --> Reprovado: fora de especificação
    Reprovado --> EmAnalise: reanálise autorizada
    Aprovado --> [*]: lote liberado p/ expedição
```

## Decisões relevantes

- **Imutabilidade de laudos:** laudo aprovado nunca é editado; correções geram nova versão com referência à anterior (exigência de auditoria).
- **Particionamento por planta:** tabelas de análise particionadas por `plant_id` — consultas regulatórias varrem anos de histórico de uma única planta.
- **Bloqueio de expedição via evento:** a liberação/bloqueio de lote é propagada por evento Kafka consumido pela Supply Chain API; não há acoplamento síncrono no caminho de expedição.
