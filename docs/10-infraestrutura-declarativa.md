# Infraestrutura declarativa isolada

## Finalidade

`infra/compose.yaml` descreve o ambiente futuro do Observatório. Ele não deve ser iniciado nesta fase. O objetivo é tornar as decisões revisáveis antes de criar recursos locais.

## Isolamento

| Recurso | Observatório | NecroPaper |
|---|---|---|
| Projeto Compose | `observatorio-socrates` | permanece inalterado |
| PostgreSQL | volume e banco próprios | banco existente não é acessado |
| n8n | volume e porta `127.0.0.1:5680` | porta `127.0.0.1:5678` preservada |
| Rede | rede interna para banco e rede de saída para n8n | rede existente não é reutilizada |
| Exportações | `infra/exports/` próprio | sem compartilhamento |

PostgreSQL não possui porta publicada e participa somente da rede `internal`. O n8n atende apenas no loopback, mas também participa da rede `egress` para consultar fontes públicas quando essa coleta for autorizada. O acesso ao Ollama ocorre pelo alias `host.docker.internal` e não exige expor a porta 11434 à internet.

## Segredos

`infra/.env` será criado manualmente a partir de `.env.infrastructure.example`, com permissões restritas. Ele conterá senhas, chave de criptografia n8n e versões de imagens. Nunca deve entrar no Git. Antes da primeira execução, a versão do n8n deve ser fixada e revisada; o placeholder atual bloqueia subida acidental.

## Ordem operacional futura

1. revisar versões de imagens e gerar segredos locais;
2. validar Compose sem iniciar serviços;
3. criar ambiente isolado;
4. confirmar saúde e isolamento de rede;
5. aplicar a migração SQL somente após nova autorização;
6. criar credencial de aplicação com privilégios mínimos;
7. importar fluxos n8n manualmente e testar em modo sem escrita.

Nenhuma dessas etapas é autorizada por este documento.
