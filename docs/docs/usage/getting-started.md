# Getting Started

## Prerequisites

- A GitHub repository in the [infinite-automations](https://github.com/infinite-automations) organization
- Workflows must be referenced by SHA or tag (enforced by linting)

## Step 1: Configure Linting

Create `.github/linters/.super-linter.env` in your repository:

```env
# Enable the linters relevant to your project
VALIDATE_GITHUB_ACTIONS=true
VALIDATE_GITHUB_ACTIONS_ZIZMOR=true
VALIDATE_YAML=true

# For Terraform repos, add:
# VALIDATE_TERRAFORM_TFLINT=true
# VALIDATE_TERRAFORM_FMT=true

# For repos with shell scripts:
# VALIDATE_BASH=true
```

## Step 2: Create Your CI Workflow

### Option A: Use Toplevel Workflow (Simple)

Best for repos without custom tests:

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

permissions: {}

jobs:
  ci:
    uses: infinite-automations/workflows/.github/workflows/ci-action.yml@v1.3.1
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
```

### Option B: Compose Baselines (Flexible)

Best for repos with custom tests:

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
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.3.1
    permissions:
      contents: read
      packages: read
      statuses: write

  test:
    needs: [lint]
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - uses: actions/checkout@v6
      - name: Your Tests
        run: echo "Run your tests here"

  release:
    needs: [lint, test]
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.3.1
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

## Step 3: Configure Semantic Release

Create `.releaserc.json` in your repository root:

```json
{
  "branches": ["main"],
  "plugins": [
    ["@semantic-release/commit-analyzer", { "preset": "conventionalcommits" }],
    [
      "@semantic-release/release-notes-generator",
      { "preset": "conventionalcommits" }
    ],
    "@semantic-release/github"
  ]
}
```

## Step 4: Configure Renovate

Add `renovate.json` to keep dependencies updated:

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["config:recommended", "helpers:pinGitHubActionDigests"],
  "automerge": true,
  "platformAutomerge": true
}
```
