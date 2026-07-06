# ${{ values.componentName }}

${{ values.description }}

MCP server do ecossistema Aurora Varejo, registrado no DevPortal com dono (`${{ values.owner }}`), contrato de tools versionado (`catalog-info.yaml`) e documentação TechDocs (`docs/`).

## Padrões da casa

- Transporte streamable-http atrás do gateway corporativo
- Auth OAuth 2.1 client credentials — um client por agente consumidor
- Toda tool nova entra primeiro no contrato (`catalog-info.yaml`) e na doc (`docs/tools.md`)
- Logging de chamadas com o client do agente consumidor, para auditoria
