#!/usr/bin/env bash
set -euo pipefail

DEST_DIR="${HOME}/.local/bin"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/agent-say"

echo "[agent-say] Installing to ${DEST_DIR}..."
mkdir -p "${DEST_DIR}"

ln -sf "${SCRIPT_PATH}" "${DEST_DIR}/agent-say"
chmod +x "${DEST_DIR}/agent-say"

echo "[agent-say] Successfully installed!"
echo "Make sure ${DEST_DIR} is in your PATH."
echo "Test command: agent-say --test"
