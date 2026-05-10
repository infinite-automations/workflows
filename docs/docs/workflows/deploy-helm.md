# Deploy (Helm)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `dry-run` | <p>Run in dry-run mode (helm diff/template instead of upgrade)</p> | `boolean` | `false` | `false` |
| `release-name` | <p>Helm release name</p> | `string` | `true` | `""` |
| `chart` | <p>Helm chart reference (e.g. stakater/application or ./chart)</p> | `string` | `true` | `""` |
| `chart-version` | <p>Helm chart version</p> | `string` | `false` | `""` |
| `namespace` | <p>Kubernetes namespace to deploy to</p> | `string` | `false` | `default` |
| `create-namespace` | <p>Create namespace if it does not exist</p> | `boolean` | `false` | `true` |
| `values-files` | <p>Newline-separated list of values files to pass to Helm</p> | `string` | `false` | `""` |
| `set-values` | <p>Newline-separated list of --set arguments (key=value)</p> | `string` | `false` | `""` |
| `helm-repos` | <p>Newline-separated list of Helm repos to add (name=url)</p> | `string` | `false` | `""` |
| `environment` | <p>GitHub environment name for deployment protection</p> | `string` | `false` | `""` |
| `runner` | <p>Runner label for the deploy job</p> | `string` | `false` | `ubuntu-latest` |
| `registry` | <p>OCI registry to authenticate with for private charts (e.g. ghcr.io)</p> | `string` | `false` | `""` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `KUBECONFIG` | <p>Kubeconfig content for cluster authentication (optional)</p> | `false` |
| `REGISTRY_USERNAME` | <p>Registry username for private Helm charts (optional)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password/token for private Helm charts (optional)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `status` | <p>Deploy result status (success or failure)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/deploy-helm.yml@vMAJOR
    with:
      dry-run:
      # Run in dry-run mode (helm diff/template instead of upgrade)
      #
      # Type: boolean
      # Required: false
      # Default: false

      release-name:
      # Helm release name
      #
      # Type: string
      # Required: true
      # Default: ""

      chart:
      # Helm chart reference (e.g. stakater/application or ./chart)
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
      # Kubernetes namespace to deploy to
      #
      # Type: string
      # Required: false
      # Default: default

      create-namespace:
      # Create namespace if it does not exist
      #
      # Type: boolean
      # Required: false
      # Default: true

      values-files:
      # Newline-separated list of values files to pass to Helm
      #
      # Type: string
      # Required: false
      # Default: ""

      set-values:
      # Newline-separated list of --set arguments (key=value)
      #
      # Type: string
      # Required: false
      # Default: ""

      helm-repos:
      # Newline-separated list of Helm repos to add (name=url)
      #
      # Type: string
      # Required: false
      # Default: ""

      environment:
      # GitHub environment name for deployment protection
      #
      # Type: string
      # Required: false
      # Default: ""

      runner:
      # Runner label for the deploy job
      #
      # Type: string
      # Required: false
      # Default: ubuntu-latest

      registry:
      # OCI registry to authenticate with for private charts (e.g. ghcr.io)
      #
      # Type: string
      # Required: false
      # Default: ""
```



