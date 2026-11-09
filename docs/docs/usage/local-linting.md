# Local Linting

Run the same Super-Linter configuration locally using Docker.

## Prerequisites

- Docker installed and running
- `.github/linters/.super-linter.env` configured

## Usage

```bash
# From the repository root
./scripts/lint-local.sh
```

The script reads the Super-Linter version from
[`lint.yml`](https://github.com/infinite-automations/workflows/blob/main/.github/workflows/lint.yml) and loads variables directly
from [`.super-linter.env`](https://github.com/infinite-automations/workflows/blob/main/.github/linters/.super-linter.env).
Only the local overrides `RUN_LOCAL=true`, `DEFAULT_BRANCH=main`, and
`VALIDATE_ALL_CODEBASE=true` are added, so the entire repository is linted.
The script accepts no arguments and does not enable fix mode.

## Configuration

The `.github/linters/.super-linter.env` file is shared between CI and local runs:

```env
# Enable validators for your project
VALIDATE_GITHUB_ACTIONS=true
VALIDATE_GITHUB_ACTIONS_ZIZMOR=true
VALIDATE_YAML=true
VALIDATE_MARKDOWN=true
```

Linter-specific configuration files in `.github/linters/` are also used:

| File                 | Linter       |
| -------------------- | ------------ |
| `actionlint.yml`     | actionlint   |
| `zizmor.yaml`        | zizmor       |
| `.yaml-lint.yml`     | yamllint     |
| `.tflint.hcl`        | tflint       |
| `.markdown-lint.yml` | markdownlint |
