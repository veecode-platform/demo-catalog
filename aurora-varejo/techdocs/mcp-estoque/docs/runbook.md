# Runbook

## Sintoma: agentes recebendo timeout nas tools de saldo

1. Verificar latência do WMS no dashboard de integrações.
2. Se o WMS estiver degradado, o MCP entra em modo fallback e responde com a posição D-1 do ERP, marcando `stale: true` na resposta — confirme se os prompts dos agentes tratam esse campo.

## Sintoma: reservas falhando com 403

Client OAuth do agente expirado ou sem o scope `estoque:reservar`. Rotação de credenciais é trimestral; ver o processo no time Plataforma.

## Contato

Time dono: **Equipe IA** (canal `#hub-ia`). Escalação: on-call de integrações.
