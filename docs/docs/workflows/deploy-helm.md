# Deploy (Helm)

Deploys an application using Helm with optional OCI registry login and Kubernetes cluster authentication.

## Usage

```yaml
jobs:
  deploy:
    uses: infinite-automations/workflows/.github/workflows/deploy-helm.yml@v1.0.0
    with:
      release-name: my-app
      chart: stakater/application
      chart-version: "5.2.3"
      namespace: production
      helm-repos: |
        stakater=https://stakater.github.io/stakater-charts
      values-files: |
        helm/common.yaml
      image-tag: "1.2.3"
    secrets:
      KUBECONFIG: ${{ secrets.KUBECONFIG }}
    permissions:
      contents: read
```

## Inputs

| Input              | Type    | Default         | Description                                     |
| ------------------ | ------- | --------------- | ----------------------------------------------- |
| `dry-run`          | boolean | `false`         | Run `helm template` instead of `helm upgrade`   |
| `release-name`     | string  | required        | Helm release name                               |
| `chart`            | string  | required        | Chart reference (e.g. `stakater/application`)   |
| `chart-version`    | string  |                 | Chart version constraint                        |
| `namespace`        | string  | `default`       | Kubernetes namespace                            |
| `create-namespace` | boolean | `true`          | Create namespace if missing                     |
| `values-files`     | string  |                 | Newline-separated list of values files          |
| `set-values`       | string  |                 | Newline-separated `key=value` pairs for `--set` |
| `helm-repos`       | string  |                 | Newline-separated repos to add (`name=url`)     |
| `image-tag`        | string  |                 | Image tag (passed as `deployment.image.tag`)    |
| `environment`      | string  |                 | GitHub environment for deployment protection    |
| `runner`           | string  | `ubuntu-latest` | Runner label                                    |
| `container-image`  | string  |                 | Container image to run the job in               |
| `registry`         | string  |                 | OCI registry for private charts                 |

## Secrets

| Secret              | Required | Description                              |
| ------------------- | -------- | ---------------------------------------- |
| `KUBECONFIG`        | No       | Kubeconfig content for cluster auth      |
| `REGISTRY_USERNAME` | No       | Username for private Helm chart registry |
| `REGISTRY_PASSWORD` | No       | Password for private Helm chart registry |

## Outputs

| Output   | Description                           |
| -------- | ------------------------------------- |
| `status` | Deploy result: `success` or `failure` |
