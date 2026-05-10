#!/usr/bin/env bash
# Run Super-Linter locally using Docker.
# Uses the same configuration as the CI workflow.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/.github/linters/.super-linter.env"

FIX_MODE=false

for arg in "$@"; do
	case "${arg}" in
	--fix)
		FIX_MODE=true
		shift
		;;
	esac
done

if [[ ! -f "${CONFIG_FILE}" ]]; then
	echo "Error: Config file not found: ${CONFIG_FILE}" >&2
	exit 1
fi

FIX_ARGS=()
if [[ "${FIX_MODE}" == "true" ]]; then
	echo "Running Super-Linter locally with FIX mode enabled..."
	# Read VALIDATE_* entries from config and derive FIX_* env vars
	while IFS= read -r line || [[ -n "${line}" ]]; do
		if [[ "${line}" =~ ^[[:space:]]*# ]] || [[ -z "${line}" ]]; then
			continue
		fi
		if [[ "${line}" =~ ^VALIDATE_(.+)=true$ ]]; then
			linter="${BASH_REMATCH[1]}"
			FIX_ARGS+=(-e "FIX_${linter}=true")
		fi
	done <"${CONFIG_FILE}"
	if [[ ${#FIX_ARGS[@]} -eq 0 ]]; then
		echo "Warning: No VALIDATE_*=true entries found, enabling all fix vars"
		FIX_ARGS+=(-e "FIX_ANSIBLE=true")
		FIX_ARGS+=(-e "FIX_CLANG_FORMAT=true")
		FIX_ARGS+=(-e "FIX_CSS=true")
		FIX_ARGS+=(-e "FIX_CSS_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_CSHARP=true")
		FIX_ARGS+=(-e "FIX_ENV=true")
		FIX_ARGS+=(-e "FIX_GO=true")
		FIX_ARGS+=(-e "FIX_GO_MODULES=true")
		FIX_ARGS+=(-e "FIX_GITHUB_ACTIONS_ZIZMOR=true")
		FIX_ARGS+=(-e "FIX_GOOGLE_JAVA_FORMAT=true")
		FIX_ARGS+=(-e "FIX_GRAPHQL_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_GROOVY=true")
		FIX_ARGS+=(-e "FIX_HTML_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_JAVASCRIPT_ES=true")
		FIX_ARGS+=(-e "FIX_JAVASCRIPT_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_JSON=true")
		FIX_ARGS+=(-e "FIX_JSON_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_JSONC=true")
		FIX_ARGS+=(-e "FIX_JSONC_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_JSX=true")
		FIX_ARGS+=(-e "FIX_JSX_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_KOTLIN=true")
		FIX_ARGS+=(-e "FIX_MARKDOWN=true")
		FIX_ARGS+=(-e "FIX_MARKDOWN_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_NATURAL_LANGUAGE=true")
		FIX_ARGS+=(-e "FIX_POWERSHELL=true")
		FIX_ARGS+=(-e "FIX_PROTOBUF=true")
		FIX_ARGS+=(-e "FIX_PYTHON_BLACK=true")
		FIX_ARGS+=(-e "FIX_PYTHON_ISORT=true")
		FIX_ARGS+=(-e "FIX_PYTHON_RUFF=true")
		FIX_ARGS+=(-e "FIX_PYTHON_RUFF_FORMAT=true")
		FIX_ARGS+=(-e "FIX_RUBY=true")
		FIX_ARGS+=(-e "FIX_RUST_2015=true")
		FIX_ARGS+=(-e "FIX_RUST_2018=true")
		FIX_ARGS+=(-e "FIX_RUST_2021=true")
		FIX_ARGS+=(-e "FIX_RUST_2024=true")
		FIX_ARGS+=(-e "FIX_RUST_CLIPPY=true")
		FIX_ARGS+=(-e "FIX_SCALAFMT=true")
		FIX_ARGS+=(-e "FIX_SHELL_SHFMT=true")
		FIX_ARGS+=(-e "FIX_SNAKEMAKE_SNAKEFMT=true")
		FIX_ARGS+=(-e "FIX_SPELL_CODESPELL=true")
		FIX_ARGS+=(-e "FIX_SQLFLUFF=true")
		FIX_ARGS+=(-e "FIX_TERRAFORM_FMT=true")
		FIX_ARGS+=(-e "FIX_TSX=true")
		FIX_ARGS+=(-e "FIX_TYPESCRIPT_ES=true")
		FIX_ARGS+=(-e "FIX_TYPESCRIPT_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_VUE=true")
		FIX_ARGS+=(-e "FIX_VUE_PRETTIER=true")
		FIX_ARGS+=(-e "FIX_YAML_PRETTIER=true")
	fi
else
	echo "Running Super-Linter locally..."
fi
echo "Config: ${CONFIG_FILE}"
echo ""

docker run --rm \
	-e RUN_LOCAL=true \
	-e DEFAULT_BRANCH=main \
	-e VALIDATE_ALL_CODEBASE=true \
	"${FIX_ARGS[@]}" \
	--env-file "${CONFIG_FILE}" \
	-v "${REPO_ROOT}:/tmp/lint" \
	"ghcr.io/super-linter/super-linter:v8.6.0" \
	"$@"
