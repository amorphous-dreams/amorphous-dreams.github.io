#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="${ROOT_DIR}/_submodules/gruv-poole"
DEST_DIR="${ROOT_DIR}/_vendor/gruv-poole"

if [[ ! -d "${SRC_DIR}" ]]; then
  echo "Missing submodule directory: ${SRC_DIR}" >&2
  echo "Run: git submodule update --init --recursive" >&2
  exit 1
fi

echo "Vendoring gruv-poole into ${DEST_DIR}"

mkdir -p "${DEST_DIR}"
rm -rf \
  "${DEST_DIR}/_includes" \
  "${DEST_DIR}/_layouts" \
  "${DEST_DIR}/_sass" \
  "${DEST_DIR}/assets"

cp -a "${SRC_DIR}/_includes" "${DEST_DIR}/"
cp -a "${SRC_DIR}/_layouts" "${DEST_DIR}/"
cp -a "${SRC_DIR}/_sass" "${DEST_DIR}/"
cp -a "${SRC_DIR}/assets" "${DEST_DIR}/"
cp -a "${SRC_DIR}/LICENSE.md" "${DEST_DIR}/"
cp -a "${SRC_DIR}/README.md" "${DEST_DIR}/UPSTREAM_README.md"

# Sync runtime assets expected by compiled theme CSS.
# theme-gruv-poole.css is emitted to /assets/, and its font URLs are /assets/fonts/...
mkdir -p "${ROOT_DIR}/assets"
rm -rf "${ROOT_DIR}/assets/fonts"
cp -a "${SRC_DIR}/assets/fonts" "${ROOT_DIR}/assets/"
cp -a "${SRC_DIR}/assets/favicon.ico" "${ROOT_DIR}/assets/favicon.ico"
cp -a "${SRC_DIR}/assets/apple-touch-icon-precomposed.png" "${ROOT_DIR}/assets/apple-touch-icon-precomposed.png"

UPSTREAM_SHA="$(git -C "${SRC_DIR}" rev-parse HEAD)"
{
  echo "source_submodule: _submodules/gruv-poole"
  echo "source_commit: ${UPSTREAM_SHA}"
} > "${DEST_DIR}/VENDORED_FROM"

echo "Done. Source commit: ${UPSTREAM_SHA}"
