# Build (.NET)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dotnet-version` | <p>The .NET SDK version to install</p> | `string` | `false` | `""` |
| `working-directory` | <p>Working directory containing the .NET solution/project</p> | `string` | `false` | `src` |
| `build-configuration` | <p>Build configuration (e.g. Release, Debug)</p> | `string` | `false` | `Release` |
| `publish-output` | <p>Output directory for dotnet publish (relative to workspace)</p> | `string` | `false` | `app` |
| `upload-artifact-name` | <p>Name of the artifact to upload</p> | `string` | `false` | `build` |
| `test-reporter` | <p>Enable test result reporting (requires checks: write)</p> | `boolean` | `false` | `true` |


## Outputs

| name | description |
| --- | --- |
| `upload-artifact-name` | <p>Name of the uploaded build artifact</p> |
| `status` | <p>Build result status (success or failure)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/build-dotnet.yml@vMAJOR
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dotnet-version:
      # The .NET SDK version to install
      #
      # Type: string
      # Required: false
      # Default: ""

      working-directory:
      # Working directory containing the .NET solution/project
      #
      # Type: string
      # Required: false
      # Default: src

      build-configuration:
      # Build configuration (e.g. Release, Debug)
      #
      # Type: string
      # Required: false
      # Default: Release

      publish-output:
      # Output directory for dotnet publish (relative to workspace)
      #
      # Type: string
      # Required: false
      # Default: app

      upload-artifact-name:
      # Name of the artifact to upload
      #
      # Type: string
      # Required: false
      # Default: build

      test-reporter:
      # Enable test result reporting (requires checks: write)
      #
      # Type: boolean
      # Required: false
      # Default: true
```



