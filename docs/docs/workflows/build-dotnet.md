# Build (.NET)

Builds, tests, and publishes a .NET application with optional test reporting and artifact upload.

## Usage

```yaml
jobs:
  build:
    uses: infinite-automations/workflows/.github/workflows/build-dotnet.yml@v1.0.0
    with:
      dotnet-version: "8.x"
      working-directory: src
    permissions:
      contents: read
      actions: read
      checks: write
```

## Inputs

| Input                 | Type    | Default   | Description                                             |
| --------------------- | ------- | --------- | ------------------------------------------------------- |
| `dotnet-version`      | string  | `8.x`     | .NET SDK version to install                             |
| `working-directory`   | string  | `src`     | Directory containing the .NET solution/project          |
| `build-configuration` | string  | `Release` | Build configuration                                     |
| `publish-output`      | string  | `app`     | Output directory for `dotnet publish`                   |
| `artifact-name`       | string  | `build`   | Name prefix of the uploaded artifact                    |
| `test-reporter`       | boolean | `true`    | Enable test result reporting (requires `checks: write`) |

## Outputs

| Output          | Description                          |
| --------------- | ------------------------------------ |
| `artifact-name` | Name of the uploaded build artifact  |
| `status`        | Build result: `success` or `failure` |
