# Lint

Lints your repository using [Super-Linter](https://github.com/super-linter/super-linter).

## Usage

```yaml
jobs:
  lint:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.0.0
    permissions:
      contents: read
      packages: read
      statuses: write
```

## Configuration

Create a `.github/linters/.super-linter.env` file in your repository to configure which linters to enable:

```env
# Enable specific validators (unset ones default to false)
VALIDATE_GITHUB_ACTIONS=true
VALIDATE_GITHUB_ACTIONS_ZIZMOR=true
VALIDATE_YAML=true
VALIDATE_TERRAFORM_TFLINT=true
VALIDATE_BASH=true
```

This same file can be used for [local linting](../usage/local-linting.md) with Docker.

Super-Linter also reads linter-specific config files from `.github/linters/` (e.g., `actionlint.yml`, `zizmor.yaml`, `.yaml-lint.yml`).

## Inputs

| Input     | Type    | Default | Description                         |
| --------- | ------- | ------- | ----------------------------------- |
| `dry-run` | boolean | `false` | No effect for linting (always runs) |

## Outputs

| Output   | Description                         |
| -------- | ----------------------------------- |
| `status` | Lint result: `success` or `failure` |
