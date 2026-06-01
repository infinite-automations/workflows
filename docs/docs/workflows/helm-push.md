# Helm Push

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (package but do not push)</p> | `boolean` | `false` | `false` |
| `helm-version` | <p>Helm version to install (e.g. v3.17.3)</p> | `string` | `false` | `latest` |
| `chart-path` | <p>Path to the Helm chart directory</p> | `string` | `true` | `""` |
| `version` | <p>Chart version to set (passed to helm package --version)</p> | `string` | `false` | `""` |
| `app-version` | <p>App version to set (passed to helm package --app-version)</p> | `string` | `false` | `""` |
| `registry` | <p>OCI registry to push to (e.g. ghcr.io)</p> | `string` | `false` | `ghcr.io` |
| `repository` | <p>OCI repository path without registry prefix (e.g. owner/charts). Defaults to github.repository.</p> | `string` | `false` | `""` |
| `download-artifact-name` | <p>Name of a build artifact to download before packing (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before packing</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `REGISTRY_USERNAME` | <p>Registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `chart` | <p>Packaged chart filename</p> |
| `version` | <p>Chart version that was pushed</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/helm-push.yml@v1.3.1
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (package but do not push)
      #
      # Type: boolean
      # Required: false
      # Default: false

      helm-version:
      # Helm version to install (e.g. v3.17.3)
      #
      # Type: string
      # Required: false
      # Default: latest

      chart-path:
      # Path to the Helm chart directory
      #
      # Type: string
      # Required: true
      # Default: ""

      version:
      # Chart version to set (passed to helm package --version)
      #
      # Type: string
      # Required: false
      # Default: ""

      app-version:
      # App version to set (passed to helm package --app-version)
      #
      # Type: string
      # Required: false
      # Default: ""

      registry:
      # OCI registry to push to (e.g. ghcr.io)
      #
      # Type: string
      # Required: false
      # Default: ghcr.io

      repository:
      # OCI repository path without registry prefix (e.g. owner/charts). Defaults to github.repository.
      #
      # Type: string
      # Required: false
      # Default: ""

      download-artifact-name:
      # Name of a build artifact to download before packing (empty to skip)
      #
      # Type: string
      # Required: false
      # Default: ""

      download-all-artifacts:
      # Download all artifacts before packing
      #
      # Type: boolean
      # Required: false
      # Default: false

      download-artifact-path:
      # Path to download the artifact to (relative to workspace)
      #
      # Type: string
      # Required: false
      # Default: ""

      download-artifact-merge-multiple:
      # Merge multiple artifacts into a single directory
      #
      # Type: boolean
      # Required: false
      # Default: true

      download-artifact-continue-on-error:
      # Continue workflow if artifact download fails
      #
      # Type: boolean
      # Required: false
      # Default: false
```



