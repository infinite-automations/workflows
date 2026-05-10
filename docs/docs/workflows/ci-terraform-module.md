# CI (Terraform Module)

Toplevel convenience workflow for Terraform module repositories. Composes lint, terraform-docs, and release.

!!! warning "Custom Tests"
This workflow does **not** include test jobs. Run your Terraform tests (plan/apply/destroy)
before calling this workflow, or compose from baseline workflows directly.

## Usage

### With Custom Tests (Recommended)

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  test:
    runs-on: ubuntu-latest
    environment: ${{ github.event_name == 'pull_request' && 'pr' || 'main' }}
    steps:
      - uses: actions/checkout@v6
      - name: Terraform Test
        # your terraform test steps

  ci:
    needs: [test]
    uses: infinite-automations/workflows/.github/workflows/ci-terraform-module.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
      working-dir: ".,bootstrap,examples/full"
    secrets: inherit
```

## Inputs

| Input         | Type    | Default     | Description                                    |
| ------------- | ------- | ----------- | ---------------------------------------------- |
| `dry-run`     | boolean | `false`     | Dry-run mode for docs and release              |
| `working-dir` | string  | `.`         | Comma-separated directories for terraform-docs |
| `output-file` | string  | `README.md` | Output file for terraform-docs                 |

## Secrets

| Secret            | Required | Description            |
| ----------------- | -------- | ---------------------- |
| `APP_ID`          | No       | GitHub App ID          |
| `APP_PRIVATE_KEY` | No       | GitHub App private key |

## Outputs

| Output         | Description          |
| -------------- | -------------------- |
| `lint-status`  | Lint result          |
| `docs-changed` | Whether docs changed |
| `version`      | Released version     |
| `published`    | Whether published    |
