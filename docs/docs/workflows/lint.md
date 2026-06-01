# Lint

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `config-file` | <p>Path to the Super-Linter env configuration file</p> | `string` | `false` | `.github/linters/.super-linter.env` |
| `validate-all-codebase` | <p>Validate all files (true) or only changed files (false)</p> | `boolean` | `false` | `true` |
| `extra-env-vars` | <p>Newline-separated KEY=VALUE pairs to pass as additional env vars to Super-Linter</p> | `string` | `false` | `""` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `APP_ID` | <p>GitHub App ID for enhanced token (enables zizmor online audits)</p> | `false` |
| `APP_PRIVATE_KEY` | <p>GitHub App private key for enhanced token</p> | `false` |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/lint.yml@v1.3.1
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      config-file:
      # Path to the Super-Linter env configuration file
      #
      # Type: string
      # Required: false
      # Default: .github/linters/.super-linter.env

      validate-all-codebase:
      # Validate all files (true) or only changed files (false)
      #
      # Type: boolean
      # Required: false
      # Default: true

      extra-env-vars:
      # Newline-separated KEY=VALUE pairs to pass as additional env vars to Super-Linter
      #
      # Type: string
      # Required: false
      # Default: ""
```



