# Documentation (Terraform)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (generate docs but do not commit)</p> | `boolean` | `false` | `false` |
| `git-push` | <p>Push generated docs directly (set false when using artifacts/semrel)</p> | `boolean` | `false` | `false` |
| `working-dir` | <p>Comma-separated list of directories to generate docs for</p> | `string` | `false` | `.` |
| `output-file` | <p>Output file name for generated docs</p> | `string` | `false` | `README.md` |
| `output-method` | <p>Output method (inject or replace)</p> | `string` | `false` | `inject` |
| `upload-artifact-name` | <p>Name of the artifact to upload with generated docs</p> | `string` | `false` | `docs` |


## Outputs

| name | description |
| --- | --- |
| `changed` | <p>Whether documentation was changed</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/docs-terraform.yml@vMAJOR
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

      git-push:
      # Push generated docs directly (set false when using artifacts/semrel)
      #
      # Type: boolean
      # Required: false
      # Default: false

      working-dir:
      # Comma-separated list of directories to generate docs for
      #
      # Type: string
      # Required: false
      # Default: .

      output-file:
      # Output file name for generated docs
      #
      # Type: string
      # Required: false
      # Default: README.md

      output-method:
      # Output method (inject or replace)
      #
      # Type: string
      # Required: false
      # Default: inject

      upload-artifact-name:
      # Name of the artifact to upload with generated docs
      #
      # Type: string
      # Required: false
      # Default: docs
```



