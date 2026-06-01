# OCI Retag

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `dry-run` | <p>Run in dry-run mode (resolve and display but do not tag)</p> | `boolean` | `false` | `false` |
| `image` | <p>Full image name without tag (e.g. ghcr.io/owner/repo)</p> | `string` | `false` | `ghcr.io/${{ github.repository }}` |
| `source-tag` | <p>Source image tag to retag from (skips metadata-action resolution when set)</p> | `string` | `false` | `""` |
| `tag-semver` | <p>Semver tag pattern for source resolution (used only when source-tag is not set)</p> | `string` | `false` | `{{version}}` |
| `tags` | <p>Newline-separated list of new tags to apply</p> | `string` | `false` | `""` |
| `registry` | <p>Container registry to authenticate with</p> | `string` | `false` | `ghcr.io` |
| `oras-version` | <p>ORAS CLI version to install</p> | `string` | `false` | `1.2.2` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `REGISTRY_USERNAME` | <p>Registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `tags` | <p>Tags that were applied (newline-separated)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/oras-tag.yml@v1.3.1
    with:
      dry-run:
      # Run in dry-run mode (resolve and display but do not tag)
      #
      # Type: boolean
      # Required: false
      # Default: false

      image:
      # Full image name without tag (e.g. ghcr.io/owner/repo)
      #
      # Type: string
      # Required: false
      # Default: ghcr.io/${{ github.repository }}

      source-tag:
      # Source image tag to retag from (skips metadata-action resolution when set)
      #
      # Type: string
      # Required: false
      # Default: ""

      tag-semver:
      # Semver tag pattern for source resolution (used only when source-tag is not set)
      #
      # Type: string
      # Required: false
      # Default: {{version}}

      tags:
      # Newline-separated list of new tags to apply
      #
      # Type: string
      # Required: false
      # Default: ""

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
```



