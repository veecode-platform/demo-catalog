# Operação

## Deploy

GitLab CI → ECS Fargate, deploy contínuo (sem aprovação manual — serviço tier-2).

## Observabilidade

- **Métricas-chave:** conexões WebSocket ativas, latência de webhook→fan-out, idade da posição mais antiga por transportadora
- **Logs:** CloudWatch `/ecs/logistics-tracker`

## Runbook — incidentes comuns

### Posições desatualizadas de uma transportadora

1. Verificar painel *Carrier Freshness* — se apenas uma transportadora está atrasada, o problema é externo.
2. Confirmar no log se os webhooks pararam de chegar ou estão falhando na validação HMAC (rotação de secret é a causa mais comum).
3. Acionar o contato técnico da transportadora; o fallback de polling assume automaticamente após 10 min sem webhook.

### Conexões WebSocket caindo em massa

1. Verificar memória dos containers — fan-out com rooms grandes pressiona heap.
2. Escalar horizontalmente; o sticky session via Kong garante reconexão estável.

## Contatos

Slack `#digital-products` · sem plantão dedicado (segue escala do Digital Products)
