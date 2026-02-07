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

UPSTREAM_SHA="$(git -C "${SRC_DIR}" rev-parse HEAD)"
{
  echo "source_submodule: _submodules/gruv-poole"
  echo "source_commit: ${UPSTREAM_SHA}"
} > "${DEST_DIR}/VENDORED_FROM"

echo "Done. Source commit: ${UPSTREAM_SHA}"
