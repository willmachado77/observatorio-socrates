# Protocolo de fontes e coleta responsável

## Objetivo

Este protocolo transforma cobertura esportiva pública em material comparável e auditável. Ele não parte da premissa de que uma fonte, jornalista ou clube age de má-fé. A hipótese de inconsistência somente pode ser avaliada depois de preservar a fonte original, delimitar o caso e comparar situações materialmente semelhantes.

## Princípios vinculantes

1. **Fonte antes de resumo.** Todo registro aponta para URL pública, emissor, data e contexto.
2. **Cobertura não é prova de intenção.** Linguagem, frequência e enquadramento são indicadores; não provam motivação psicológica.
3. **Simetria de método.** A mesma ficha, as mesmas categorias e o mesmo padrão de evidência são aplicados ao Corinthians e a qualquer clube comparado.
4. **Contexto prevalece sobre recorte.** Trechos curtos servem como índice, mas a revisão decide após consultar a fala completa disponível.
5. **Registro de incerteza.** Ausência de evidência é um resultado válido: a hipótese deve poder ser encerrada sem acusação.
6. **Mínima coleta.** Apenas conteúdo publicamente acessível e necessário ao objetivo é registrado.

## Escopo de fontes elegíveis

| Classe | Exemplos funcionais | Uso no MVP |
|---|---|---|
| Canal institucional | programa esportivo ou veículo | comparar linha editorial e pauta |
| Profissional individual | comentarista, repórter ou setorista | comparar declarações do mesmo emissor |
| Conteúdo audiovisual público | vídeo, live, podcast e corte oficial | preservar timestamp e contexto |
| Texto público | notícia, coluna, transcrição e postagem pública | registrar versão e data de consulta |

Não entram no MVP: grupos privados, mensagens vazadas, dados de audiência identificáveis, perfis pessoais sem relevância editorial e reuploads sem vínculo verificável com a fonte original.

## Critérios de inclusão

Uma fonte pode ser cadastrada quando houver: identificação pública estável; URL-base; relação editorial clara com futebol brasileiro; conteúdo acessível sem burlar autenticação; e justificativa de cobertura no recorte escolhido. O cadastro não é rótulo ideológico, lista de suspeitos nem acusação.

## Amostragem inicial

O MVP usará uma amostra pequena e deliberada, nunca uma varredura ilimitada:

- 3 a 5 fontes de perfis editoriais diferentes;
- um tema por ciclo de análise;
- janela temporal explícita, por exemplo 30 dias;
- até 10 itens por fonte e por ciclo;
- pelo menos um caso comparável de outro clube antes de qualquer conclusão.

Qualquer ampliação de fontes, período ou volume exige nova decisão registrada.

## Ficha obrigatória de fonte

| Campo | Regra |
|---|---|
| `source_id` | identificador interno imutável |
| nome público e tipo | como a fonte se apresenta |
| URL-base e URL canônica | origem verificável |
| responsável editorial, se público | sem inferências pessoais |
| recorte e justificativa | por que integra a amostra |
| data de entrada e revisor | rastreabilidade |
| status | proposta, ativa, pausada ou arquivada |

## Ficha obrigatória de item

Registrar URL canônica, título, emissor, data/hora exibida, data/hora de captura, formato, duração quando houver, tema, clubes citados, idioma, origem da transcrição e hash do arquivo ou texto obtido. Nunca alterar silenciosamente uma transcrição: correções geram nova versão com motivo.

## Cadeia de custódia

1. Registrar metadados e URL antes de classificar.
2. Preservar transcrição com data e método de obtenção.
3. Marcar trechos por timestamp ou posição textual.
4. Relacionar cada afirmação ao item de origem.
5. Relacionar cada comparação à justificativa de equivalência.
6. Registrar decisão humana, responsável e motivo.

O modelo local pode sugerir tema, tom ou trechos; sua saída é sempre rascunho identificável e não substitui a evidência.

## Protocolo de comparação

Uma comparação exige tema, período, natureza do fato, situação competitiva e disponibilidade de informação suficientemente próximos. O revisor deve explicar diferenças relevantes. Não são comparáveis, por padrão, fatos de gravidade distinta, períodos distantes sem justificativa ou casos cuja informação pública disponível difira substancialmente.

Indicadores registráveis: linguagem moralizante, grau de certeza, exigência de prova, atribuição de culpa, omissão de contexto, frequência e duração de cobertura. O dossiê descreve padrões observados; não atribui intenção sem prova independente.

## Revisão e governança

As decisões possíveis são `descartar`, `complementar contexto`, `sem evidência suficiente` e `aprovar dossiê privado`. Publicação externa não é etapa deste fluxo. A cada ciclo, um revisor verifica amostragem, equivalência, fontes originais, trechos e linguagem conclusiva. Discordâncias são registradas, não apagadas.

## Proteção e retenção

Credenciais não entram nas fichas. Dados públicos são mantidos somente pelo tempo útil ao dossiê e com finalidade documentada. Conteúdo removido da fonte não será redistribuído; o registro conserva apenas metadados, hash, data de acesso e anotação de indisponibilidade quando necessário.
