# CI (Action)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout in child workflows (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (lint runs normally, release is dry-run)</p> | `boolean` | `false` | `false` |
| `skip-lint` | <p>Skip the lint job (useful when lint is run separately)</p> | `boolean` | `false` | `false` |
| `source-file` | <p>Path to the action.yml file for docs generation</p> | `string` | `false` | `action.yml` |
| `readme-file` | <p>Path to the README file to update</p> | `string` | `false` | `README.md` |
| `source-dir` | <p>Directory of workflow/action files to generate docs for (mutually exclusive with source-file)</p> | `string` | `false` | `""` |
| `docs-dir` | <p>Output directory for generated docs (used with source-dir)</p> | `string` | `false` | `""` |
| `source-glob` | <p>Glob pattern to match files in source-dir</p> | `string` | `false` | `*.yml` |
| `toc-level` | <p>TOC heading level for generated docs</p> | `number` | `false` | `2` |
| `docs-artifact-name` | <p>Name of the artifact to upload with generated docs</p> | `string` | `false` | `docs` |
| `action-docs-version` | <p>Version of action-docs tool to use</p> | `string` | `false` | `2.5.1` |
| `node-version` | <p>Node.js version to use</p> | `string` | `false` | `lts/*` |
| `semrel-extra-plugins` | <p>Newline-separated list of extra semantic-release plugins</p> | `string` | `false` | `""` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `APP_ID` | <p>GitHub App ID for release authentication (optional)</p> | `false` |
| `APP_PRIVATE_KEY` | <p>GitHub App private key for release authentication (optional)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `lint-status` | <p>Lint result status</p> |
| `docs-changed` | <p>Whether documentation was changed</p> |
| `version` | <p>Released version</p> |
| `published` | <p>Whether a new version was published</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/ci-action.yml@vMAJOR
    with:
      ref:
      # Git ref to checkout in child workflows (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (lint runs normally, release is dry-run)
      #
      # Type: boolean
      # Required: false
      # Default: false

      skip-lint:
      # Skip the lint job (useful when lint is run separately)
      #
      # Type: boolean
      # Required: false
      # Default: false

      source-file:
      # Path to the action.yml file for docs generation
      #
      # Type: string
      # Required: false
      # Default: action.yml

      readme-file:
      # Path to the README file to update
      #
      # Type: string
      # Required: false
      # Default: README.md

      source-dir:
      # Directory of workflow/action files to generate docs for (mutually exclusive with source-file)
      #
      # Type: string
      # Required: false
      # Default: ""

      docs-dir:
      # Output directory for generated docs (used with source-dir)
      #
      # Type: string
      # Required: false
      # Default: ""

      source-glob:
      # Glob pattern to match files in source-dir
      #
      # Type: string
      # Required: false
      # Default: *.yml

      toc-level:
      # TOC heading level for generated docs
      #
      # Type: number
      # Required: false
      # Default: 2

      docs-artifact-name:
      # Name of the artifact to upload with generated docs
      #
      # Type: string
      # Required: false
      # Default: docs

      action-docs-version:
      # Version of action-docs tool to use
      #
      # Type: string
      # Required: false
      # Default: 2.5.1

      node-version:
      # Node.js version to use
      #
      # Type: string
      # Required: false
      # Default: lts/*

      semrel-extra-plugins:
      # Newline-separated list of extra semantic-release plugins
      #
      # Type: string
      # Required: false
      # Default: ""
```



