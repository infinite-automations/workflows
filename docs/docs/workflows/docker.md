# Docker Build & Push

Builds and pushes a Docker image using Buildx with GitHub Actions cache.

## Usage

```yaml
jobs:
  docker:
    uses: infinite-automations/workflows/.github/workflows/docker.yml@v1.0.0
    with:
      context: src/MyApp
    permissions:
      contents: read
      packages: write
```

## Inputs

| Input        | Type    | Default                            | Description                                       |
| ------------ | ------- | ---------------------------------- | ------------------------------------------------- |
| `dry-run`    | boolean | `false`                            | Build but do not push                             |
| `image`      | string  | `ghcr.io/${{ github.repository }}` | Full image name                                   |
| `context`    | string  | `.`                                | Docker build context path                         |
| `file`       | string  |                                    | Dockerfile path (relative to context)             |
| `tags`       | string  |                                    | Newline-separated extra tags                      |
| `tag-semver` | string  | `{{version}}`                      | SemVer tag pattern for metadata-action            |
| `tag-latest` | boolean | `false`                            | Also tag as `latest`                              |
| `registry`   | string  | `ghcr.io`                          | Container registry to authenticate with           |
| `build-args` | string  |                                    | Newline-separated build arguments                 |
| `platforms`  | string  |                                    | Target platforms (e.g. `linux/amd64,linux/arm64`) |
| `cache-from` | string  | `type=gha`                         | Cache source                                      |
| `cache-to`   | string  | `type=gha,mode=max`                | Cache destination                                 |
| `target`     | string  |                                    | Docker build target stage                         |

## Secrets

| Secret              | Required | Description                                      |
| ------------------- | -------- | ------------------------------------------------ |
| `REGISTRY_USERNAME` | No       | Registry username (defaults to repository owner) |
| `REGISTRY_PASSWORD` | No       | Registry password (defaults to `GITHUB_TOKEN`)   |

## Outputs

| Output   | Description                            |
| -------- | -------------------------------------- |
| `image`  | Full image reference with digest       |
| `digest` | Image digest                           |
| `tags`   | Applied image tags (newline-separated) |
