# Examples

## GitHub Action Repository

A typical GitHub Action repository using composable workflows with custom tests:

```yaml
name: Test & Release

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

permissions: {}

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  lint:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.0.0
    permissions:
      contents: read
      packages: read
      statuses: write

  test:
    name: Test
    needs: [lint]
    runs-on: ubuntu-latest
    permissions:
      contents: read
    strategy:
      matrix:
        include:
          - name: "Test A"
            input-a: "value1"
          - name: "Test B"
            input-a: "value2"
    steps:
      - uses: actions/checkout@v6
      - name: Run Action
        uses: ./
        with:
          input-a: ${{ matrix.input-a }}

  docs:
    needs: [lint]
    uses: infinite-automations/workflows/.github/workflows/docs-action.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    permissions:
      contents: write

  release:
    needs: [lint, test, docs]
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
      extra-plugins: |
        conventional-changelog-conventionalcommits
        semantic-release-major-tag
        semantic-release-replace-plugin
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

## Terraform Module Repository

```yaml
name: Test & Release

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

permissions: {}

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: false

jobs:
  lint:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.0.0
    permissions:
      contents: read
      packages: read
      statuses: write

  test:
    name: Terraform Test
    needs: [lint]
    runs-on: ubuntu-latest
    environment:
      name: ${{ github.event_name == 'pull_request' && 'pr' || 'main' }}
    permissions:
      contents: read
      id-token: write
    steps:
      - uses: actions/checkout@v6
      - name: Terraform Apply
        # Your terraform test steps here
        run: echo "terraform apply"

  docs:
    needs: [lint]
    uses: infinite-automations/workflows/.github/workflows/docs-terraform.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
      working-dir: ".,bootstrap,examples/full"
    permissions:
      contents: write

  release:
    needs: [lint, test, docs]
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
    permissions:
      contents: write
      issues: write
      pull-requests: write
```
