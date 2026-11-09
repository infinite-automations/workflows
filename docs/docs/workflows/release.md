# Release

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run semantic-release in dry-run mode</p> | `boolean` | `false` | `false` |
| `extra-plugins` | <p>Newline-separated list of extra semantic-release plugins (blank lines and full-line comments are ignored)</p> | `string` | `false` | `""` |
| `node-version` | <p>Node.js version to use</p> | `string` | `false` | `lts/*` |
| `download-artifact-name` | <p>Name of a build artifact to download before releasing (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before releasing (ignored if download-artifact-name is set)</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |
| `semantic-version` | <p>Version range for semantic-release (e.g. '19.0.5')</p> | `string` | `false` | `""` |
| `branches` | <p>Branches on which releases should happen (semantic-release v16+, JSON array or string)</p> | `string` | `false` | `""` |
| `working-directory` | <p>Working directory for semantic release (useful for monorepos)</p> | `string` | `false` | `""` |
| `tag-format` | <p>Tag format override, useful for monorepos (e.g. 'my-package-v${version}')</p> | `string` | `false` | `""` |
| `extends` | <p>Newline-separated list of sharable configurations to extend</p> | `string` | `false` | `""` |
| `ci` | <p>Whether to run semantic release with CI support (semantic-release v16+)</p> | `boolean` | `false` | `true` |
| `unset-gha-env` | <p>Unset the GITHUB_ACTIONS env variable (useful for PR dry-run validation)</p> | `boolean` | `false` | `false` |
| `repository-url` | <p>Git repository URL (defaults to current repository)</p> | `string` | `false` | `""` |


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
| `channel` | <p>Distribution channel of the release</p> |
| `notes` | <p>Release notes</p> |
| `git-head` | <p>Commit SHA of the release</p> |
| `git-tag` | <p>Git tag of the release</p> |
| `last-release-version` | <p>Version of the previous release</p> |
| `last-release-git-head` | <p>Commit SHA of the previous release</p> |
| `last-release-git-tag` | <p>Git tag of the previous release</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.5.0
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run semantic-release in dry-run mode
      #
      # Type: boolean
      # Required: false
      # Default: false

      extra-plugins:
      # Newline-separated list of extra semantic-release plugins (blank lines and full-line comments are ignored)
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

      semantic-version:
      # Version range for semantic-release (e.g. '19.0.5')
      #
      # Type: string
      # Required: false
      # Default: ""

      branches:
      # Branches on which releases should happen (semantic-release v16+, JSON array or string)
      #
      # Type: string
      # Required: false
      # Default: ""

      working-directory:
      # Working directory for semantic release (useful for monorepos)
      #
      # Type: string
      # Required: false
      # Default: ""

      tag-format:
      # Tag format override, useful for monorepos (e.g. 'my-package-v${version}')
      #
      # Type: string
      # Required: false
      # Default: ""

      extends:
      # Newline-separated list of sharable configurations to extend
      #
      # Type: string
      # Required: false
      # Default: ""

      ci:
      # Whether to run semantic release with CI support (semantic-release v16+)
      #
      # Type: boolean
      # Required: false
      # Default: true

      unset-gha-env:
      # Unset the GITHUB_ACTIONS env variable (useful for PR dry-run validation)
      #
      # Type: boolean
      # Required: false
      # Default: false

      repository-url:
      # Git repository URL (defaults to current repository)
      #
      # Type: string
      # Required: false
      # Default: ""
```



