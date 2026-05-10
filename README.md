# Reusable Workflows

[![Release](https://github.com/infinite-automations/workflows/actions/workflows/_release.yml/badge.svg)](https://github.com/infinite-automations/workflows/actions/workflows/_release.yml)

Centralized, reusable GitHub Actions workflows for the [infinite-automations](https://github.com/infinite-automations) organization.

:book: **[Documentation](https://infinite-automations.github.io/workflows/)**

## Purpose

1. **Centralize** workflow maintenance — action updates, tests, and releases in one place
2. **Standardize** CI/CD patterns across all repositories

## Available Workflows

### Baseline (Composable Building Blocks)

| Workflow                                                     | Description                                                                                                |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| [`lint.yml`](.github/workflows/lint.yml)                     | Linting via [Super-Linter](https://github.com/super-linter/super-linter) with file-based config            |
| [`build-dotnet.yml`](.github/workflows/build-dotnet.yml)     | .NET restore, build, test, publish with artifact upload                                                    |
| [`docker.yml`](.github/workflows/docker.yml)                 | Docker build & push with metadata, Buildx, and GHA cache                                                   |
| [`oras-tag.yml`](.github/workflows/oras-tag.yml)             | OCI image retagging via [ORAS](https://oras.land) (retag without rebuild)                                  |
| [`deploy-helm.yml`](.github/workflows/deploy-helm.yml)       | Helm deployment with optional registry/kubeconfig auth                                                     |
| [`docs-action.yml`](.github/workflows/docs-action.yml)       | Documentation for GitHub Actions/Workflows via [action-docs](https://github.com/npalm/action-docs)         |
| [`docs-terraform.yml`](.github/workflows/docs-terraform.yml) | Documentation for Terraform modules via [terraform-docs](https://github.com/terraform-docs/terraform-docs) |
| [`docs-mkdocs.yml`](.github/workflows/docs-mkdocs.yml)       | MkDocs site build + GitHub Pages deployment                                                                |
| [`release.yml`](.github/workflows/release.yml)               | Semantic Release with configurable plugins                                                                 |

### Toplevel (Convenience Compositions)

| Workflow                                                               | Composes              | Use Case                                    |
| ---------------------------------------------------------------------- | --------------------- | ------------------------------------------- |
| [`ci-action.yml`](.github/workflows/ci-action.yml)                     | lint → docs → release | GitHub Action repos without custom tests    |
| [`ci-terraform-module.yml`](.github/workflows/ci-terraform-module.yml) | lint → docs → release | Terraform module repos without custom tests |

<!-- textlint-disable terminology -->

| [`ci-dotnet.yml`](.github/workflows/ci-dotnet.yml) | lint → build → docker → release | .NET application repos |

<!-- textlint-enable terminology -->

| [`cd-docker-helm.yml`](.github/workflows/cd-docker-helm.yml) | retag → deploy | Docker + Helm deployment (release-triggered) |

> **Note:** Toplevel workflows do not include test jobs. GitHub Actions requires `uses:` to be a static string, so custom test workflows cannot be dynamically referenced. Run your tests before or alongside the toplevel workflow.

## Quick Start

### Compose Baselines (Recommended for repos with tests)

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

permissions: {}

jobs:
  lint:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.0.0
    permissions:
      contents: read
      packages: read
      statuses: write

  test:
    needs: [lint]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - run: echo "your tests here"

  release:
    needs: [lint, test]
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

### Use Toplevel Workflow (Simple repos)

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  ci:
    uses: infinite-automations/workflows/.github/workflows/ci-action.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
```

## Configuration

### Linting

Create `.github/linters/.super-linter.env` to configure Super-Linter:

```env
VALIDATE_GITHUB_ACTIONS=true
VALIDATE_GITHUB_ACTIONS_ZIZMOR=true
VALIDATE_YAML=true
```

The same file is used for [local linting](#local-linting) via Docker.

### Local Linting

```bash
./scripts/lint-local.sh
```

Or directly with Docker:

```bash
docker run --rm \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  --env-file .github/linters/.super-linter.env \
  -v "$(pwd):/tmp/lint" \
  ghcr.io/super-linter/super-linter:v8.6.0
```

## Design Principles

- **Composable** — baseline workflows are independent building blocks
- **Configurable** — no hardcoded parameters; all via inputs, secrets, and env files
- **Dry-run** — every workflow supports `dry-run: true` for PR validation
- **Consistent** — inputs use `kebab-case`, secrets use `UPPER_SNAKE_CASE`
- **Observable** — every workflow writes a standardized `$GITHUB_STEP_SUMMARY`
- **Secure** — all actions pinned to SHA, minimal permissions

## Documentation

Full documentation is available at the [GitHub Pages site](https://infinite-automations.github.io/workflows/).

## License

[MIT](LICENSE)

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.

<!-- END_TF_DOCS -->
