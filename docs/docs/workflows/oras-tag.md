# OCI Retag

Retags an existing OCI image using [ORAS](https://oras.land) without rebuilding. Useful for promoting images from CI tags (branch/sha) to release tags (semver/latest).

## Usage

```yaml
jobs:
  retag:
    uses: infinite-automations/workflows/.github/workflows/oras-tag.yml@v1.0.0
    with:
      image: ghcr.io/my-org/my-app
      tags: |
        1.2.3
        latest
    permissions:
      contents: read
      packages: write
```

## Source Tag Resolution

When `source-tag` is not provided, it is resolved automatically:

1. **Release event** → uses `github.event.release.target_commitish` (e.g. `main`)
2. **Other events** → uses `github.ref_name`

This matches the `type=ref,event=branch` tag that [`docker.yml`](docker.md) generates during CI, allowing the CD workflow to find the image without knowing the exact tag.

## Inputs

| Input          | Type    | Default   | Description                                 |
| -------------- | ------- | --------- | ------------------------------------------- |
| `dry-run`      | boolean | `false`   | Resolve and display but do not tag          |
| `image`        | string  | required  | Full image name without tag                 |
| `source-tag`   | string  |           | Tag to retag from (auto-resolved if empty)  |
| `tags`         | string  |           | Newline-separated list of new tags to apply |
| `tag-latest`   | boolean | `false`   | Also tag as `latest`                        |
| `registry`     | string  | `ghcr.io` | Container registry to authenticate with     |
| `oras-version` | string  | `1.2.2`   | ORAS CLI version                            |

## Secrets

| Secret              | Required | Description                                      |
| ------------------- | -------- | ------------------------------------------------ |
| `REGISTRY_USERNAME` | No       | Registry username (defaults to repository owner) |
| `REGISTRY_PASSWORD` | No       | Registry password (defaults to `GITHUB_TOKEN`)   |

## Outputs

| Output | Description                                |
| ------ | ------------------------------------------ |
| `tags` | Tags that were applied (newline-separated) |
