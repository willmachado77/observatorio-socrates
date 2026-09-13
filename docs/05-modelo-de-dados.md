# Modelo de dados do MVP

O banco será próprio e terá um usuário de aplicação com privilégios mínimos. Nenhuma tabela do NecroPaper será usada.

| Entidade | Conteúdo essencial | Finalidade |
|---|---|---|
| `sources` | canal, emissor, URL-base, tipo, situação | catálogo de fontes autorizadas |
| `items` | fonte, URL canônica, título, data, duração, hash | uma publicação pública registrada |
| `transcripts` | item, idioma, texto, origem, versão | texto com proveniência |
| `claims` | trecho, timestamp, tema, tipo de afirmação | unidade analisável |
| `cases` | tema, descrição factual, clubes envolvidos | caso comparável |
| `comparisons` | dois ou mais claims, justificativa de equivalência | hipótese documentada |
| `reviews` | decisão, revisor, data, justificativa | controle humano |
| `evidence_exports` | versão, filtros, hash, responsável | dossiê reproduzível |

## Regras de integridade

- URL canônica única por item.
- Transcrição é versionada; correções não apagam a anterior.
- Uma comparação só pode ser marcada como concluída após revisão.
- Todo dossiê registra os IDs e hashes das evidências usadas.
- Não serão armazenados dados pessoais que não sejam estritamente públicos e necessários para identificar a fonte.
