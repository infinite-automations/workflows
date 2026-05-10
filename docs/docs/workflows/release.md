# Release

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `dry-run` | <p>Run semantic-release in dry-run mode</p> | `boolean` | `false` | `false` |
| `extra-plugins` | <p>Newline-separated list of extra semantic-release plugins</p> | `string` | `false` | `""` |
| `node-version` | <p>Node.js version to use</p> | `string` | `false` | `lts/*` |
| `download-artifact-name` | <p>Name of a build artifact to download before releasing (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before releasing (ignored if download-artifact-name is set)</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `APP_ID` | <p>GitHub App ID for authentication (optional, falls back to GITHUB_TOKEN)</p> | `false` |
| `APP_PRIVATE_KEY` | <p>GitHub App private key for authentication (optional)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `version` | <p>Released version (empty if no release)</p> |
| `published` | <p>Whether a new version was published</p> |
| `major` | <p>Major version number</p> |
| `minor` | <p>Minor version number</p> |
| `patch` | <p>Patch version number</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/release.yml@vMAJOR
    with:
      dry-run:
      # Run semantic-release in dry-run mode
      #
      # Type: boolean
      # Required: false
      # Default: false

      extra-plugins:
      # Newline-separated list of extra semantic-release plugins
      #
      # Type: string
      # Required: false
      # Default: ""

      node-version:
      # Node.js version to use
      #
      # Type: string
      # Required: false
      # Default: lts/*

      download-artifact-name:
      # Name of a build artifact to download before releasing (empty to skip)
      #
      # Type: string
      # Required: false
      # Default: ""

      download-all-artifacts:
      # Download all artifacts before releasing (ignored if download-artifact-name is set)
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



