# ADR 0001 — Arquitetura local-first

## Status

Aceita — 2026-09-13

## Decisão

O MVP usará os serviços locais já existentes: Docker, n8n, PostgreSQL e Ollama. O n8n orquestra tarefas; PostgreSQL preserva o registro auditável; Ollama auxilia na classificação; a revisão humana controla conclusões e qualquer publicação.

## Consequências

Reduz-se exposição de dados e custo recorrente. Em contrapartida, o processamento depende dos recursos da máquina local e requer documentação de manutenção.
