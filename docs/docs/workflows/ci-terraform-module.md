# CI (Terraform Module)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout in child workflows (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (lint runs normally, release is dry-run)</p> | `boolean` | `false` | `false` |
| `skip-lint` | <p>Skip the lint job (useful when lint is run separately)</p> | `boolean` | `false` | `false` |
| `working-dir` | <p>Comma-separated list of directories for terraform-docs</p> | `string` | `false` | `.` |
| `output-file` | <p>Output file name for terraform-docs</p> | `string` | `false` | `README.md` |
| `output-method` | <p>Output method for terraform-docs (inject or replace)</p> | `string` | `false` | `inject` |
| `docs-artifact-name` | <p>Name of the artifact to upload with generated docs</p> | `string` | `false` | `docs` |
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
    uses: infinite-automations/workflows/.github/workflows/ci-terraform-module.yml@vMAJOR
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

      working-dir:
      # Comma-separated list of directories for terraform-docs
      #
      # Type: string
      # Required: false
      # Default: .

      output-file:
      # Output file name for terraform-docs
      #
      # Type: string
      # Required: false
      # Default: README.md

      output-method:
      # Output method for terraform-docs (inject or replace)
      #
      # Type: string
      # Required: false
      # Default: inject

      docs-artifact-name:
      # Name of the artifact to upload with generated docs
      #
      # Type: string
      # Required: false
      # Default: docs

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



