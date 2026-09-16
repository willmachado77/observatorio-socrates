# Operação: backup e restauração

## Finalidade

O backup diário preserva o banco PostgreSQL exclusivo do Observatório Sócrates.
Ele inclui tanto as tabelas internas do n8n quanto as tabelas do Observatório.

## Implementação

- Script versionado: `infra/scripts/backup-postgres.sh`;
- Serviço de usuário: `observatorio-socrates-backup.service`;
- Timer diário: `observatorio-socrates-backup.timer`;
- Horário: 03:30;
- Persistência: execuções perdidas durante desligamento são realizadas quando o
  usuário voltar a ter sessão disponível;
- Retenção: dumps com mais de 13 dias completos são removidos após um novo dump
  validado;
- Diretório: `/ocupa/backups/observatorio-socrates/postgres/`;
- Arquivos e diretórios: permissões restritas (`600` e `700`).

Cada dump é criado em formato PostgreSQL custom, validado com `pg_restore --list`
e só então recebe o nome definitivo.

## Verificação

Execute:

    systemctl --user status observatorio-socrates-backup.timer
    systemctl --user list-timers observatorio-socrates-backup.timer --all
    find /ocupa/backups/observatorio-socrates/postgres -type f -printf '%M %s bytes  %p\n'

## Restauração

Restaurações não devem ocorrer diretamente sobre o ambiente operacional sem
diagnóstico e autorização explícita. Primeiro, valide o dump em banco ou
ambiente separado. A restauração precisa preservar o `infra/.env` correspondente:
a chave `N8N_ENCRYPTION_KEY` é necessária para o n8n continuar decifrando suas
credenciais armazenadas.

O dump não contém o arquivo `infra/.env`; ele deve permanecer protegido,
armazenado separadamente e jamais ser versionado.
