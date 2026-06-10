# Quality Control Service

Gestão de controle de qualidade industrial — laudos de análise, inspeções de lote e conformidade regulatória (ANVISA, FDA e normas ISO aplicáveis às plantas).

!!! warning "Serviço crítico"
    Lotes sem laudo aprovado **não podem ser expedidos**. Indisponibilidade prolongada bloqueia a expedição — siga o [runbook](operacao.md).

## Funcionalidades

- Registro de análises laboratoriais por lote (físico-químicas e microbiológicas)
- Workflow de aprovação de laudos com dupla assinatura digital
- Certificados de análise (CoA) gerados em PDF e enviados a clientes
- Trilha de auditoria completa para inspeções regulatórias

## Stack

- **Linguagem:** Python 3.12 + FastAPI
- **Persistência:** PostgreSQL 16 com particionamento por planta
- **Documentos:** geração de CoA via WeasyPrint, armazenamento em S3 com retenção de 10 anos
- **Autenticação:** OIDC + assinatura digital ICP-Brasil para aprovação de laudos

## Time responsável

**Data Services** — canal `#data-services` no Slack. Plantão PagerDuty, escala `qc-service-oncall`.
