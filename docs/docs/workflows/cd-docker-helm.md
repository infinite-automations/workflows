# CD (Docker + Helm)

Toplevel convenience workflow for deploying Docker images with Helm. Retags an existing image (built during CI) and deploys via Helm.

## Usage

### Triggered by Release

```yaml
name: Deploy

on:
  release:
    types: [released]

permissions: {}

jobs:
  deploy:
    uses: infinite-automations/workflows/.github/workflows/cd-docker-helm.yml@v1.0.0
    with:
      release-name: my-app
      chart: stakater/application
      chart-version: "5.2.3"
      namespace: production
      tags: |
        ${{ github.event.release.tag_name }}
      tag-latest: true
      helm-repos: |
        stakater=https://stakater.github.io/stakater-charts
      values-files: |
        helm/common.yaml
      deploy-environment: production
    secrets:
      KUBECONFIG: ${{ secrets.KUBECONFIG }}
    permissions:
      contents: read
      packages: write
```

The `source-tag` is automatically resolved from `github.event.release.target_commitish` (the branch name), matching the `type=ref,event=branch` tag that CI pushed.

### With Explicit Source Tag

```yaml
jobs:
  deploy:
    uses: infinite-automations/workflows/.github/workflows/cd-docker-helm.yml@v1.0.0
    with:
      source-tag: sha-abc1234
      release-name: my-app
      chart: stakater/application
      namespace: staging
```

## Inputs

| Input                | Type    | Default                            | Description                                |
| -------------------- | ------- | ---------------------------------- | ------------------------------------------ |
| `dry-run`            | boolean | `false`                            | Do not tag or deploy                       |
| `deploy-dry-run`     | boolean | `false`                            | Tag normally but dry-run the deploy        |
| `image`              | string  | `ghcr.io/${{ github.repository }}` | Image name                                 |
| `source-tag`         | string  |                                    | Tag to retag from (auto-resolved if empty) |
| `tags`               | string  |                                    | Newline-separated tags to apply            |
| `tag-latest`         | boolean | `false`                            | Also tag as `latest`                       |
| `release-name`       | string  | required                           | Helm release name                          |
| `chart`              | string  | required                           | Helm chart reference                       |
| `chart-version`      | string  |                                    | Chart version                              |
| `namespace`          | string  | `default`                          | Kubernetes namespace                       |
| `values-files`       | string  |                                    | Helm values files                          |
| `set-values`         | string  |                                    | `--set` key=value pairs                    |
| `helm-repos`         | string  |                                    | Helm repos to add (`name=url`)             |
| `image-tag`          | string  |                                    | Override tag for Helm deploy               |
| `deploy-environment` | string  |                                    | GitHub environment for protection          |
| `deploy-runner`      | string  | `ubuntu-latest`                    | Runner label                               |
| `deploy-container`   | string  |                                    | Container image for deploy job             |
| `helm-registry`      | string  |                                    | OCI registry for private charts            |

## Secrets

| Secret                   | Required | Description                          |
| ------------------------ | -------- | ------------------------------------ |
| `REGISTRY_USERNAME`      | No       | Image registry username              |
| `REGISTRY_PASSWORD`      | No       | Image registry password              |
| `HELM_REGISTRY_USERNAME` | No       | Private Helm chart registry username |
| `HELM_REGISTRY_PASSWORD` | No       | Private Helm chart registry password |
| `KUBECONFIG`             | No       | Kubeconfig for cluster auth          |

## Outputs

| Output          | Description           |
| --------------- | --------------------- |
| `retag-tags`    | Tags applied to image |
| `deploy-status` | Deploy result         |
