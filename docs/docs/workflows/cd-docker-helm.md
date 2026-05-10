# CD (Docker + Helm)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `dry-run` | <p>Run in dry-run mode (do not tag or deploy)</p> | `boolean` | `false` | `false` |
| `deploy-dry-run` | <p>Run deploy in dry-run mode (tag normally but only template/diff the Helm release)</p> | `boolean` | `false` | `false` |
| `image` | <p>Full image name (e.g. ghcr.io/owner/repo)</p> | `string` | `false` | `ghcr.io/${{ github.repository }}` |
| `tags` | <p>Newline-separated tags to apply to the image (only if provided)</p> | `string` | `false` | `""` |
| `source-tag` | <p>Source image tag to retag from (skips metadata-action resolution when set)</p> | `string` | `false` | `""` |
| `tag-semver` | <p>Semver tag pattern for source resolution (must match docker workflow config)</p> | `string` | `false` | `{{version}}` |
| `registry` | <p>Container registry to authenticate with</p> | `string` | `false` | `ghcr.io` |
| `oras-version` | <p>ORAS CLI version to install</p> | `string` | `false` | `1.2.2` |
| `release-name` | <p>Helm release name</p> | `string` | `true` | `""` |
| `chart` | <p>Helm chart reference</p> | `string` | `true` | `""` |
| `chart-version` | <p>Helm chart version</p> | `string` | `false` | `""` |
| `namespace` | <p>Kubernetes namespace</p> | `string` | `false` | `default` |
| `values-files` | <p>Newline-separated list of Helm values files</p> | `string` | `false` | `""` |
| `set-values` | <p>Newline-separated list of --set key=value pairs</p> | `string` | `false` | `""` |
| `helm-repos` | <p>Newline-separated list of Helm repos (name=url)</p> | `string` | `false` | `""` |
| `create-namespace` | <p>Create namespace if it does not exist</p> | `boolean` | `false` | `true` |
| `deploy-environment` | <p>GitHub environment name for deployment protection</p> | `string` | `false` | `""` |
| `deploy-runner` | <p>Runner label for the deploy job</p> | `string` | `false` | `ubuntu-latest` |
| `helm-registry` | <p>OCI registry for private Helm charts (e.g. ghcr.io)</p> | `string` | `false` | `""` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `REGISTRY_USERNAME` | <p>Registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |
| `HELM_REGISTRY_USERNAME` | <p>Username for private Helm chart registry (optional)</p> | `false` |
| `HELM_REGISTRY_PASSWORD` | <p>Password/token for private Helm chart registry (optional)</p> | `false` |
| `KUBECONFIG` | <p>Kubeconfig content for Kubernetes cluster authentication (optional)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `retag-tags` | <p>Tags applied to the image</p> |
| `deploy-status` | <p>Deploy result status</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/cd-docker-helm.yml@vMAJOR
    with:
      dry-run:
      # Run in dry-run mode (do not tag or deploy)
      #
      # Type: boolean
      # Required: false
      # Default: false

      deploy-dry-run:
      # Run deploy in dry-run mode (tag normally but only template/diff the Helm release)
      #
      # Type: boolean
      # Required: false
      # Default: false

      image:
      # Full image name (e.g. ghcr.io/owner/repo)
      #
      # Type: string
      # Required: false
      # Default: ghcr.io/${{ github.repository }}

      tags:
      # Newline-separated tags to apply to the image (only if provided)
      #
      # Type: string
      # Required: false
      # Default: ""

      source-tag:
      # Source image tag to retag from (skips metadata-action resolution when set)
      #
      # Type: string
      # Required: false
      # Default: ""

      tag-semver:
      # Semver tag pattern for source resolution (must match docker workflow config)
      #
      # Type: string
      # Required: false
      # Default: {{version}}

      registry:
      # Container registry to authenticate with
      #
      # Type: string
      # Required: false
      # Default: ghcr.io

      oras-version:
      # ORAS CLI version to install
      #
      # Type: string
      # Required: false
      # Default: 1.2.2

      release-name:
      # Helm release name
      #
      # Type: string
      # Required: true
      # Default: ""

      chart:
      # Helm chart reference
      #
      # Type: string
      # Required: true
      # Default: ""

      chart-version:
      # Helm chart version
      #
      # Type: string
      # Required: false
      # Default: ""

      namespace:
      # Kubernetes namespace
      #
      # Type: string
      # Required: false
      # Default: default

      values-files:
      # Newline-separated list of Helm values files
      #
      # Type: string
      # Required: false
      # Default: ""

      set-values:
      # Newline-separated list of --set key=value pairs
      #
      # Type: string
      # Required: false
      # Default: ""

      helm-repos:
      # Newline-separated list of Helm repos (name=url)
      #
      # Type: string
      # Required: false
      # Default: ""

      create-namespace:
      # Create namespace if it does not exist
      #
      # Type: boolean
      # Required: false
      # Default: true

      deploy-environment:
      # GitHub environment name for deployment protection
      #
      # Type: string
      # Required: false
      # Default: ""

      deploy-runner:
      # Runner label for the deploy job
      #
      # Type: string
      # Required: false
      # Default: ubuntu-latest

      helm-registry:
      # OCI registry for private Helm charts (e.g. ghcr.io)
      #
      # Type: string
      # Required: false
      # Default: ""
```



