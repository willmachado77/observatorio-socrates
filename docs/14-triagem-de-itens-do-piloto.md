# Triagem de itens do ciclo-piloto financeiro

## Finalidade

A triagem separa descoberta de evidência. Um candidato encontrado em busca
pública não é, por si só, item aceito, comparação ou evidência de padrão
editorial.

O arquivo-modelo correspondente está em
`infra/templates/triagem-itens-piloto.tsv`.

## Universo de busca

A descoberta cobre a janela comum de 01/04/2025 a 30/04/2025 e o painel
congelado do ciclo-piloto:

- Os Donos da Bola;
- ge;
- ESPN Brasil;
- UOL Esporte;
- Jovem Pan Esportes.

Os três clubes devem receber o mesmo conjunto de consultas:

1. `balanço 2024`;
2. `demonstrações financeiras 2024`;
3. `contas de 2024`;
4. `balanço financeiro 2024`.

As consultas são aplicadas separadamente a Corinthians, São Paulo FC e
Palmeiras. Variações adicionais só podem ser usadas se forem aplicadas aos
três clubes e anotadas no campo `consulta`.

## Registro mínimo

Cada candidato deve guardar URL canônica, título literal, fonte, data de
publicação disponível, precisão da data, clube principal, formato, consulta
usada e justificativa de pertinência.

`data_publicacao` pode permanecer vazia quando a página não a informa.
Nesse caso, `precisao_data` deve ser `ausente`; nunca se deve inferir a data
pela posição da busca, pela URL ou pelo momento de captura.

## Critérios de aceitação

Um candidato entra na fila de cadastro no PostgreSQL somente se:

1. pertencer a uma das fontes do painel;
2. possuir URL pública e canônica;
3. estiver publicado na janela global, quando houver data verificável;
4. tiver como assunto central a divulgação, análise ou repercussão das
   demonstrações financeiras de 2024;
5. não for republicação idêntica, agregador sem autoria verificável ou página
   de resultados;
6. tiver a decisão humana registrada como `aceitar`.

Itens sobre eleições, litígios, contratações ou política interna só entram se
o vínculo central com as contas de 2024 estiver explícito.

## Estados de decisão

- `pendente`: encontrado, ainda não revisado;
- `aceitar`: apto ao cadastro formal;
- `descartar`: fora do recorte, duplicado ou sem vínculo central;
- `complementar`: requer contexto, data ou URL canônica;
- `revisar_equivalencia`: envolve mais de um clube ou exige avaliação humana.

## Limites analíticos

A contagem só poderá ocorrer depois da deduplicação e da revisão humana.
Ausência em uma busca não prova ausência de cobertura. Título, quantidade de
itens ou tom isolado não demonstram intenção editorial.
