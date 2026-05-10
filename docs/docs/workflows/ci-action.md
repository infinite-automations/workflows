# CI (Action)

Toplevel convenience workflow for GitHub Action repositories. Composes lint, docs, and release.

!!! warning "Custom Tests"
This workflow does **not** include test jobs. Run your tests before calling this workflow,
or compose from baseline workflows directly.

## Usage

### Without Custom Tests

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
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
```

### With Custom Tests

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
    steps:
      - uses: actions/checkout@v6
      - name: Run Tests
        uses: ./
        with:
          # your test inputs

  ci:
    needs: [test]
    uses: infinite-automations/workflows/.github/workflows/ci-action.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
```

## Inputs

| Input         | Type    | Default      | Description                       |
| ------------- | ------- | ------------ | --------------------------------- |
| `dry-run`     | boolean | `false`      | Dry-run mode for docs and release |
| `source-file` | string  | `action.yml` | Action YAML file for docs         |
| `readme-file` | string  | `README.md`  | Readme to update                  |

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
