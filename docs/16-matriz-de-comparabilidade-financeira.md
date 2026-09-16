# Matriz de comparabilidade financeira — ciclo-piloto

## Finalidade

Esta matriz determina se as alegações factuais já registradas permitem uma
comparação entre Corinthians, São Paulo FC e Palmeiras. Ela separa existência
de números publicados de comparabilidade metodológica.

Não avalia qualidade de gestão, responsabilidade, intenção editorial ou
tratamento desigual de qualquer fonte.

## Evidência mínima atualmente registrada

| Clube | Fonte | Informação factual registrada | Escopo observável |
|---|---|---|---|
| Corinthians | ge | Déficit de R$ 181,766 milhões em 2024 | resultado anual |
| São Paulo FC | ge | Déficit de R$ 287,640 milhões e dívida total de R$ 968,255 milhões | resultado anual e dívida declarada |
| Palmeiras | ge | Receita de R$ 1,2 bilhão; R$ 440,3 milhões oriundos de transações | receita anual e componente de receita |

As alegações estão vinculadas aos respectivos itens no PostgreSQL. Os textos
integrais das matérias não foram armazenados.

## Teste de comparabilidade

| Indicador | Corinthians | São Paulo FC | Palmeiras | Resultado |
|---|---|---|---|---|
| Resultado anual (déficit/superávit) | déficit registrado | déficit registrado | superávit contábil registrado | comparável com ressalvas |
| Dívida total | número reportado em item, ainda sem alegação registrada | disponível | não disponível neste lote | não comparável |
| Receita total | número reportado em item, ainda sem alegação registrada | número reportado em item, ainda sem alegação registrada | disponível | não comparável |
| Receita com transferências | não registrada como alegação | não registrada como alegação | disponível | não comparável |
| Composição de passivos | não normalizada | não normalizada | não disponível neste lote | não comparável |

## Limites indispensáveis

1. Valores de dívida só podem ser comparados após verificar se incluem estádio,
   contingências, obrigações tributárias, empréstimos, juros e passivos de
   curto e longo prazo sob o mesmo critério.
2. Déficit, receita total e receita com transferências são indicadores
   diferentes; não podem ser postos como se medissem o mesmo fenômeno.
3. A data de publicação da matéria não substitui a data de referência das
   demonstrações financeiras.
4. Três itens da mesma fonte oferecem uma base factual balanceada inicial, mas
   não demonstram padrão de cobertura.
5. O item UOL sobre Corinthians, marcado `revisar_equivalencia`, continua fora
   de qualquer base comparativa.

## Decisão do ciclo

Há base factual mínima para uma comparação estrita do
`resultado_anual_2024`: os três clubes possuem alegação factual, referente a
2024, vinculada a matérias do ge sobre seus respectivos balanços.

O estado da comparação permanece `needs_context`. Os valores não harmonizam
demonstrações contábeis, composição de passivos, receitas ou critérios de
apuração; por isso, não autorizam conclusão causal, avaliação de gestão ou
qualquer inferência sobre cobertura editorial.

Um registro técnico em `comparisons` pode organizar essas três alegações, desde
que mantenha o estado `needs_context` e uma justificativa de equivalência seja
revisada por humano antes de qualquer conclusão.

## Próximo requisito

A próxima coleta deve buscar, para os três clubes e com a mesma definição:

- resultado anual;
- receita total;
- receita com negociações de atletas;
- dívida ou passivo, com notas sobre sua composição.

Cada valor deverá informar fonte, ano de referência, unidade monetária,
definição e limitações antes de qualquer comparação.
