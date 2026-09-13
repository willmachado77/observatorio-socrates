# Segurança e governança

- PostgreSQL será a fonte de verdade para metadados e resultados revisados.
- Segredos ficam somente em `.env` local ou mecanismo equivalente; nunca em Git, n8n exportado ou relatório.
- Serviços devem permanecer em interfaces locais ou na rede privada Docker necessária.
- O modelo local não pode confirmar fatos, aprovar coleta sensível ou publicar conteúdo.
- Toda saída destinada ao público requer revisão humana e decisão explícita.
- Alterações de schema, automações e integrações externas devem ser registradas em uma ADR e aprovadas antes da execução.
