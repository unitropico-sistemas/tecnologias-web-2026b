#!/usr/bin/env bash
# Crea las etiquetas del repositorio del curso.
# Requiere GitHub CLI autenticado:  gh auth login
#
#   ./scripts/crear-etiquetas.sh usuario-u-organizacion/tecnologias-web-2026b

set -euo pipefail

REPO="${1:-}"
if [[ -z "$REPO" ]]; then
  echo "Uso: $0 <propietario>/<repositorio>" >&2
  exit 1
fi

crear() {
  gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force
}

echo "Creando etiquetas en $REPO"

# Estado del bloqueo
crear "estado:abierto"     "D93F0B" "Publicado, nadie lo está mirando todavía"
crear "estado:en-analisis" "FBCA04" "Alguien está trabajando en él"
crear "estado:resuelto"    "0E8A16" "Funcionó y la entrada del banco ya está integrada"

# Grupo
crear "grupo:1" "00564D" "Grupo 1 — jueves 8:00 a 10:00 a. m."
crear "grupo:2" "0B6B62" "Grupo 2 — jueves 10:00 a 12:00 m."

# Ruta de profundización
crear "ruta:A" "AC9A61" "Contenerización y DevOps"
crear "ruta:B" "AC9A61" "Tiempo real y AJAX avanzado"
crear "ruta:C" "AC9A61" "PWA y funcionamiento sin conexión"
crear "ruta:D" "AC9A61" "API-first y datos abiertos"
crear "ruta:E" "AC9A61" "Modelos de lenguaje en la web"
crear "ruta:F" "AC9A61" "Comercio electrónico y pagos"
crear "ruta:G" "AC9A61" "Seguridad web"
crear "ruta:H" "AC9A61" "Visualización y web geoespacial"
crear "ruta:I" "AC9A61" "Telemetría IoT simulada"

# Transversales
crear "bloquea-entrega" "B60205" "Pone en riesgo la próxima entrega evaluada"
crear "corte:1"         "C5DEF5" "Aporte contabilizado en el primer corte (semanas 1 a 8)"
crear "corte:2"         "C5DEF5" "Aporte contabilizado en el segundo corte (semanas 9 a 16)"
crear "banco"           "5319E7" "Pull request de entrada al banco de conocimiento"

echo "Listo."
