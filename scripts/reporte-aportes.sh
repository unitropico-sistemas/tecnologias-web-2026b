#!/usr/bin/env bash
# Reporte de aportes al muro de bloqueos y al banco de conocimiento.
# Requiere GitHub CLI autenticado:  gh auth login
#
#   ./scripts/reporte-aportes.sh usuario-u-organizacion/tecnologias-web-2026b
#   ./scripts/reporte-aportes.sh usuario-u-organizacion/tecnologias-web-2026b 2026-08-31 2026-10-22

set -euo pipefail

REPO="${1:-}"
DESDE="${2:-}"
HASTA="${3:-}"

if [[ -z "$REPO" ]]; then
  echo "Uso: $0 <propietario>/<repositorio> [fecha-desde] [fecha-hasta]" >&2
  exit 1
fi

RANGO=""
if [[ -n "$DESDE" && -n "$HASTA" ]]; then
  RANGO="created:${DESDE}..${HASTA}"
  echo "Rango: $DESDE a $HASTA"
else
  echo "Rango: todo el semestre"
fi

echo
echo "=== Bloqueos publicados por autor ==="
gh issue list --repo "$REPO" --state all --limit 400 \
  --json author --jq '.[].author.login' | sort | uniq -c | sort -rn

echo
echo "=== Entradas al banco integradas por autor ==="
gh pr list --repo "$REPO" --state merged --limit 400 \
  --json author --jq '.[].author.login' | sort | uniq -c | sort -rn

echo
echo "=== Bloqueos abiertos hace más de 7 días ==="
gh issue list --repo "$REPO" --state open --limit 200 \
  --json number,title,createdAt,labels \
  --jq '.[] | select((now - (.createdAt | fromdateiso8601)) > 604800)
        | "  #\(.number)  \(.createdAt[0:10])  \(.title)"'

echo
echo "=== Bloqueos que ponen en riesgo una entrega ==="
gh issue list --repo "$REPO" --state open --label "bloquea-entrega" --limit 100 \
  --json number,title --jq '.[] | "  #\(.number)  \(.title)"'

echo
echo "Nota: estas cifras son insumo, no calificación. El banco no se califica por"
echo "cantidad sino por utilidad de las entradas para quien no vivió el problema."
