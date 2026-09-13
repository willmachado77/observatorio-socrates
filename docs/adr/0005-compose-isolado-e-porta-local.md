# ADR 0005 — Compose isolado e porta local exclusiva

## Status

Aceita — 2026-09-13

## Decisão

O Observatório terá projeto Compose, rede, volumes e porta n8n próprios. A porta será limitada a `127.0.0.1:5680`; PostgreSQL não será publicado ao host.

## Consequências

Evita colisões e acesso involuntário ao NecroPaper. Exige configuração de segredos e versões próprias, mas permite manutenção e backup independentes.
