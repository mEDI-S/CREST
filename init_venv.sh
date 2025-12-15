#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="./.venv"

if [[ ! -d "${VENV_DIR}" ]]; then
	echo "Creating virtual environment at ${VENV_DIR}..."
	if command -v python3 >/dev/null 2>&1; then
		python3 -m venv "${VENV_DIR}"
	else
		virtualenv "${VENV_DIR}"
	fi

	source "${VENV_DIR}/bin/activate"
	pip install --upgrade pip
	pip install -r "${SCRIPT_DIR}/requirements.txt"
    python3 CREST_v1.0.py
else
	echo "Reusing existing virtual environment at ${VENV_DIR}."
	source "${VENV_DIR}/bin/activate"
    python3 CREST_v1.0.py
fi
