# Reusable Workflows

Centralized, reusable GitHub Actions workflows for the [infinite-automations](https://github.com/infinite-automations) organization.

## Purpose

1. **Centralize** workflow maintenance — action updates, tests, and releases in one place
2. **Standardize** CI/CD patterns across all repositories

## Quick Start

```yaml
# In your repository's .github/workflows/ci.yml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  lint:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.3.1
    permissions:
      contents: read
      packages: read
      statuses: write

  release:
    needs: [lint]
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.3.1
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets: inherit
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

## Available Workflows

See the Workflows section for auto-generated documentation of all reusable workflows.
