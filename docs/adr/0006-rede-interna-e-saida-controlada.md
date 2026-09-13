# ADR 0006 — Rede interna para dados e saída controlada

## Status

Aceita — 2026-09-13

## Decisão

PostgreSQL permanece exclusivamente na rede Docker interna. O n8n participa
também de uma rede de saída, sem portas públicas adicionais, para que a futura
coleta de fontes públicas seja tecnicamente possível.

## Consequências

A separação impede acesso externo direto ao banco e conserva a interface n8n
no loopback. Fluxos n8n precisarão de fontes autorizadas, limites de requisição
