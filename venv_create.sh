#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_NAME="pyvisa_venv"
VENV_DIR="${SCRIPT_DIR}/${VENV_NAME}"
REQ_FILE="${SCRIPT_DIR}/requirements.txt"

cd "${SCRIPT_DIR}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Erro: python3 não encontrado."
  exit 1
fi

if [ ! -f "${REQ_FILE}" ]; then
  echo "Erro: requirements.txt não encontrado em: ${SCRIPT_DIR}"
  exit 1
fi

# Cria o venv apenas se não existir
if [ ! -d "${VENV_DIR}" ]; then
  echo "Criando venv '${VENV_NAME}'..."
  python3 -m venv "${VENV_DIR}"
else
  echo "Venv '${VENV_NAME}' já existe. Reutilizando..."
fi

VENV_PY="${VENV_DIR}/bin/python"
VENV_PIP="${VENV_DIR}/bin/pip"

echo "Atualizando pip no venv..."
"${VENV_PY}" -m pip install --upgrade pip

echo "Instalando dependências do requirements.txt no venv..."
"${VENV_PIP}" install -r "${REQ_FILE}"

echo "Concluído."
echo "Venv criado em: ${SCRIPT_DIR}/${VENV_NAME}"
echo "Para ativar manualmente depois:"
echo "  source ${SCRIPT_DIR}/${VENV_NAME}/bin/activate"
echo "Ou chame o script activate_venv.sh"