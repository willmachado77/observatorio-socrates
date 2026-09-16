#!/usr/bin/env bash
set -euo pipefail
umask 077

project_root="/ocupa/dev/observatorio-socrates"
backup_dir="/ocupa/backups/observatorio-socrates/postgres"
timestamp="$(date -u +%Y-%m-%dT%H-%M-%SZ)"
filename="observatorio-socrates_${timestamp}.dump"
temporary_file="${backup_dir}/${filename}.tmp"
final_file="${backup_dir}/${filename}"

compose() {
  /usr/bin/docker compose \
    --env-file "${project_root}/infra/.env" \
    -f "${project_root}/infra/compose.yaml" \
    "$@"
}

install -d -m 700 "${backup_dir}"

compose exec -T postgres \
  pg_isready -U observatorio_owner -d observatorio_socrates >/dev/null

compose exec -T postgres \
  pg_dump -U observatorio_owner -d observatorio_socrates \
  --format=custom --compress=9 >"${temporary_file}"

docker run --rm \
  -v "${backup_dir}:/backups:ro" \
  postgres:16-alpine \
  pg_restore --list "/backups/${filename}.tmp" >/dev/null

mv "${temporary_file}" "${final_file}"

find "${backup_dir}" \
  -maxdepth 1 -type f \
  -name 'observatorio-socrates_*.dump' \
  -mtime +13 -print -delete

echo "BACKUP_OK: ${final_file}"
