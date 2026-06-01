# Documentation (MkDocs)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (build but do not deploy)</p> | `boolean` | `false` | `false` |
| `docs-dir` | <p>Directory containing mkdocs.yml</p> | `string` | `false` | `docs` |
| `python-version` | <p>Python version to use for MkDocs</p> | `string` | `false` | `3.x` |
| `deploy-branch` | <p>Branch to deploy to via mkdocs gh-deploy (empty = skip deploy)</p> | `string` | `false` | `""` |
| `deploy-prefix` | <p>Subdirectory on deploy-branch for preview deploys (empty = deploy to root)</p> | `string` | `false` | `""` |
| `deploy-version` | <p>Version label for mike versioned deploy (empty = unversioned deploy)</p> | `string` | `false` | `""` |
| `set-latest` | <p>Set this version as latest (for root index). Only true for release deploys.</p> | `boolean` | `false` | `false` |
| `mike-version` | <p>mike version to install for versioned deploys (empty = skip install)</p> | `string` | `false` | `2.1.3` |
| `mkdocs-version` | <p>MkDocs version to install (empty = skip install)</p> | `string` | `false` | `1.6.1` |
| `mkdocs-material-version` | <p>MkDocs Material version to install (empty = skip install)</p> | `string` | `false` | `9.7.6` |
| `pip-plugins` | <p>Space-separated list of additional pip packages to install (MkDocs plugins)</p> | `string` | `false` | `""` |
| `upload-artifact-name` | <p>Name of the artifact to upload with built site</p> | `string` | `false` | `docs-site` |
| `download-artifact-name` | <p>Name of a build artifact to download before building (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before building</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |


## Outputs

| name | description |
| --- | --- |
| `upload-artifact-name` | <p>Name of the uploaded artifact</p> |
| `preview-url` | <p>URL of the deployed preview site (only set for prefix deploys)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/docs-mkdocs.yml@v1.3.1
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (build but do not deploy)
      #
      # Type: boolean
      # Required: false
      # Default: false

      docs-dir:
      # Directory containing mkdocs.yml
      #
      # Type: string
      # Required: false
      # Default: docs

      python-version:
      # Python version to use for MkDocs
      #
      # Type: string
      # Required: false
      # Default: 3.x

      deploy-branch:
      # Branch to deploy to via mkdocs gh-deploy (empty = skip deploy)
      #
      # Type: string
      # Required: false
      # Default: ""

      deploy-prefix:
      # Subdirectory on deploy-branch for preview deploys (empty = deploy to root)
      #
      # Type: string
      # Required: false
      # Default: ""

      deploy-version:
      # Version label for mike versioned deploy (empty = unversioned deploy)
      #
      # Type: string
      # Required: false
      # Default: ""

      set-latest:
      # Set this version as latest (for root index). Only true for release deploys.
      #
      # Type: boolean
      # Required: false
      # Default: false

      mike-version:
      # mike version to install for versioned deploys (empty = skip install)
      #
      # Type: string
      # Required: false
      # Default: 2.1.3

      mkdocs-version:
      # MkDocs version to install (empty = skip install)
      #
      # Type: string
      # Required: false
      # Default: 1.6.1

      mkdocs-material-version:
      # MkDocs Material version to install (empty = skip install)
      #
      # Type: string
      # Required: false
      # Default: 9.7.6

      pip-plugins:
      # Space-separated list of additional pip packages to install (MkDocs plugins)
      #
      # Type: string
      # Required: false
      # Default: ""

      upload-artifact-name:
      # Name of the artifact to upload with built site
      #
      # Type: string
      # Required: false
      # Default: docs-site

      download-artifact-name:
      # Name of a build artifact to download before building (empty to skip)
      #
      # Type: string
      # Required: false
      # Default: ""

      download-all-artifacts:
      # Download all artifacts before building
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



