# Documentation (MkDocs)

Builds a [MkDocs](https://www.mkdocs.org/) site using [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). Optionally deploys to GitHub Pages via `mkdocs gh-deploy` when `deploy-branch` is set.

## Usage

Build only (e.g. for PRs):

```yaml
jobs:
  docs:
    uses: infinite-automations/workflows/.github/workflows/docs-mkdocs.yml@v1.0.0
    with:
      dry-run: true
    permissions:
      contents: read
```

Build and deploy to GitHub Pages:

```yaml
jobs:
  docs:
    uses: infinite-automations/workflows/.github/workflows/docs-mkdocs.yml@v1.0.0
    with:
      deploy-branch: gh-pages
    permissions:
      contents: write
```

## Inputs

| Input            | Type    | Default     | Description                                         |
| ---------------- | ------- | ----------- | --------------------------------------------------- |
| `dry-run`        | boolean | `false`     | Build but do not deploy                             |
| `docs-dir`       | string  | `docs`      | Directory containing `mkdocs.yml`                   |
| `python-version` | string  | `3.x`       | Python version for MkDocs                           |
| `deploy-branch`  | string  | `""`        | Branch for `mkdocs gh-deploy` (empty = skip deploy) |
| `artifact-name`  | string  | `docs-site` | Artifact name for built site                        |

## Outputs

| Output          | Description                   |
| --------------- | ----------------------------- |
| `artifact-name` | Name of the uploaded artifact |

## Prerequisites

- A `mkdocs.yml` configuration file in the specified `docs-dir`
- If deploying: GitHub Pages configured to serve from the `deploy-branch`
