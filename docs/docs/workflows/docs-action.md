# Documentation (Action/Workflow)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (generate docs but do not commit)</p> | `boolean` | `false` | `false` |
| `source-file` | <p>Path to a single action.yml or workflow file (mutually exclusive with source-dir)</p> | `string` | `false` | `""` |
| `readme-file` | <p>Path to the README file to update (used with source-file)</p> | `string` | `false` | `README.md` |
| `source-dir` | <p>Directory of workflow/action files to generate docs for (mutually exclusive with source-file)</p> | `string` | `false` | `""` |
| `docs-dir` | <p>Output directory for generated docs (used with source-dir)</p> | `string` | `false` | `""` |
| `source-glob` | <p>Glob pattern to match files in source-dir (used with source-dir)</p> | `string` | `false` | `*.yml` |
| `toc-level` | <p>TOC heading level for generated docs</p> | `number` | `false` | `2` |
| `upload-artifact-name` | <p>Name of the artifact to upload with generated docs</p> | `string` | `false` | `docs` |
| `action-docs-version` | <p>action-docs version to install</p> | `string` | `false` | `2.5.1` |
| `node-version` | <p>Node.js version to use</p> | `string` | `false` | `lts/*` |


## Outputs

| name | description |
| --- | --- |
| `changed` | <p>Whether documentation was changed</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/docs-action.yml@vMAJOR
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (generate docs but do not commit)
      #
      # Type: boolean
      # Required: false
      # Default: false

      source-file:
      # Path to a single action.yml or workflow file (mutually exclusive with source-dir)
      #
      # Type: string
      # Required: false
      # Default: ""

      readme-file:
      # Path to the README file to update (used with source-file)
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
      # Glob pattern to match files in source-dir (used with source-dir)
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

      upload-artifact-name:
      # Name of the artifact to upload with generated docs
      #
      # Type: string
      # Required: false
      # Default: docs

      action-docs-version:
      # action-docs version to install
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
```



