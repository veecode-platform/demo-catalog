# Governança de preço

## Por que o MCP não altera preço

Precificação afeta margem em 650 lojas. A decisão de desenho foi expor **leitura e simulação** aos agentes e manter a escrita no fluxo humano com alçada de aprovação. `simular_precificacao` existe exatamente para o agente propor cenários sem risco.

## Auditoria

Toda chamada de tool é logada com o client OAuth do agente consumidor, permitindo rastrear qual assistente consultou ou simulou o quê.

## Limites

- Simulações consideram elasticidade da última janela de 90 dias.
- Campanhas relâmpago (< 4h) podem não aparecer em `listar_campanhas_ativas` — cache de campanha é de 5 minutos.
