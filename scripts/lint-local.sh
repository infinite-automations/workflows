#!/usr/bin/env bash
# Run Super-Linter locally using Docker.
# Uses the same configuration as the CI workflow.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/.github/linters/.super-linter.env"
WORKFLOW_FILE="${REPO_ROOT}/.github/workflows/lint.yml"

if [[ $# -ne 0 ]]; then
	echo "Usage: ${0}" >&2
	exit 1
fi

LINTER_VERSION="$(sed -nE 's|^[[:space:]]*uses: super-linter/super-linter@[^[:space:]]+[[:space:]]+# (v[0-9]+\.[0-9]+\.[0-9]+)[[:space:]]*$|\1|p' "${WORKFLOW_FILE}")"
if [[ ! "${LINTER_VERSION}" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	echo "Error: Could not read a unique Super-Linter version from ${WORKFLOW_FILE}" >&2
	exit 1
fi

docker run --rm \
	--env-file "${CONFIG_FILE}" \
	-e RUN_LOCAL=true \
	-e DEFAULT_BRANCH=main \
	-e VALIDATE_ALL_CODEBASE=true \
	-v "${REPO_ROOT}:/tmp/lint" \
	"ghcr.io/super-linter/super-linter:${LINTER_VERSION}"
