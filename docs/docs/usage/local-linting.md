# Local Linting

Run the same Super-Linter configuration locally using Docker.

## Prerequisites

- Docker installed and running
- `.github/linters/.super-linter.env` configured

## Usage

### Using the Script

```bash
# From the repository root
./scripts/lint-local.sh
```

### Using Docker Directly

```bash
docker run --rm \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  --env-file .github/linters/.super-linter.env \
  -v "$(pwd):/tmp/lint" \
  ghcr.io/super-linter/super-linter:v8.6.0
```

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
