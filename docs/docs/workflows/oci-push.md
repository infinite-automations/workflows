# OCI Push

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (pack but do not push)</p> | `boolean` | `false` | `false` |
| `artifact` | <p>Full artifact reference without tag (e.g. ghcr.io/owner/repo/my-chart)</p> | `string` | `true` | `""` |
| `path` | <p>Path to the directory or file to pack and push</p> | `string` | `true` | `""` |
| `version` | <p>Artifact version tag (overrides auto-detection)</p> | `string` | `false` | `""` |
| `tag-semver` | <p>Semver tag pattern for auto-detection (used only when version is not set)</p> | `string` | `false` | `{{version}}` |
| `tags` | <p>Newline-separated list of additional tags to apply</p> | `string` | `false` | `""` |
| `registry` | <p>Container registry to authenticate with</p> | `string` | `false` | `ghcr.io` |
| `artifact-type` | <p>Artifact type to set in the OCI manifest (e.g. application/vnd.cncf.helm.config.v1+json)</p> | `string` | `false` | `""` |
| `pack-output` | <p>Path to write the packed .tgz archive (relative to workspace). When set, the path input is packed into a .tgz at this location before pushing.</p> | `string` | `false` | `""` |
| `annotations` | <p>Newline-separated list of annotations (key=value) to attach to the artifact</p> | `string` | `false` | `""` |
| `download-artifact-name` | <p>Name of a build artifact to download before packing (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before packing</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |
| `oras-version` | <p>ORAS CLI version to install</p> | `string` | `false` | `1.2.2` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `REGISTRY_USERNAME` | <p>Registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `digest` | <p>Pushed artifact digest</p> |
| `reference` | <p>Full artifact reference with digest</p> |
| `tags` | <p>Tags applied to the artifact (newline-separated)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/oci-push.yml@vMAJOR
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (pack but do not push)
      #
      # Type: boolean
      # Required: false
      # Default: false

      artifact:
      # Full artifact reference without tag (e.g. ghcr.io/owner/repo/my-chart)
      #
      # Type: string
      # Required: true
      # Default: ""

      path:
      # Path to the directory or file to pack and push
      #
      # Type: string
      # Required: true
      # Default: ""

      version:
      # Artifact version tag (overrides auto-detection)
      #
      # Type: string
      # Required: false
      # Default: ""

      tag-semver:
      # Semver tag pattern for auto-detection (used only when version is not set)
      #
      # Type: string
      # Required: false
      # Default: {{version}}

      tags:
      # Newline-separated list of additional tags to apply
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

      artifact-type:
      # Artifact type to set in the OCI manifest (e.g. application/vnd.cncf.helm.config.v1+json)
      #
      # Type: string
      # Required: false
      # Default: ""

      pack-output:
      # Path to write the packed .tgz archive (relative to workspace). When set, the path input is packed into a .tgz at this location before pushing.
      #
      # Type: string
      # Required: false
      # Default: ""

      annotations:
      # Newline-separated list of annotations (key=value) to attach to the artifact
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

      oras-version:
      # ORAS CLI version to install
      #
      # Type: string
      # Required: false
      # Default: 1.2.2
```



