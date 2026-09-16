# Descoberta documentada do ciclo-piloto

## Decisão

O ciclo-piloto financeiro adota descoberta documentada. O objetivo é localizar
e registrar de modo reproduzível itens públicos candidatos dentro do painel
congelado, sem alegar cobertura exaustiva de cada fonte.

## O que a decisão permite

- buscas públicas com consulta, fonte, clube e período registrados;
- registro de URLs encontradas, inclusive quando posteriormente descartadas;
- indicação de consultas sem resultado observável;
- comparação apenas entre itens que passaram pela triagem humana.

## O que a decisão não permite

- afirmar que uma fonte não publicou sobre um clube apenas porque uma busca não
  encontrou resultado;
- transformar a quantidade de resultados indexados em medida completa de
  cobertura;
- inferir intenção editorial a partir de ausência, título, volume ou tom
  isolado;
- tratar uma consulta executada como substituta de acervo, API, feed ou
  arquivo integral da fonte.

## Log operacional

Cada linha de `data/triage/2025-04-financial-pilot-search-log.tsv` deve
registrar:

- termo, clube, fonte e janela temporal;
- estado da consulta;
- quantidade de candidatos efetivamente registrados;
- data de execução;
- método de descoberta;
- observações, bloqueios e limitações.

Estados aceitos:

- `pendente`;
- `executada_com_candidatos`;
- `executada_sem_candidatos`;
- `bloqueada`;
- `revisar`.

O resultado do piloto será descrito como amostra de descoberta documentada.
