# CI (.NET)

Toplevel convenience workflow for .NET application repositories. Composes lint, build, Docker, and release.

!!! warning "Custom Tests"
This workflow does **not** include custom test jobs beyond `dotnet test`.
If you need additional integration tests, compose from baseline workflows directly.

## Usage

```yaml
name: CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]

jobs:
  ci:
    uses: infinite-automations/workflows/.github/workflows/ci-dotnet.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
      dotnet-version: "8.x"
      working-directory: src
      docker-context: src/MyApp
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
    permissions:
      contents: write
      issues: write
      packages: write
      pull-requests: write
      statuses: write
      actions: read
      checks: write
```

## Inputs

| Input                  | Type    | Default                            | Description                                     |
| ---------------------- | ------- | ---------------------------------- | ----------------------------------------------- |
| `dry-run`              | boolean | `false`                            | Lint and build run normally, release is dry-run |
| `skip-lint`            | boolean | `false`                            | Skip the lint job                               |
| `skip-docker`          | boolean | `false`                            | Skip the Docker build job                       |
| `dotnet-version`       | string  | `8.x`                              | .NET SDK version                                |
| `working-directory`    | string  | `.`                                | .NET solution/project directory                 |
| `build-configuration`  | string  | `Release`                          | Build configuration                             |
| `docker-image`         | string  | `ghcr.io/${{ github.repository }}` | Docker image name                               |
| `docker-context`       | string  | `.`                                | Docker build context                            |
| `docker-file`          | string  |                                    | Dockerfile path                                 |
| `docker-target`        | string  |                                    | Docker build target stage                       |
| `semrel-extra-plugins` | string  |                                    | Extra semantic-release plugins                  |

## Secrets

| Secret              | Required | Description                    |
| ------------------- | -------- | ------------------------------ |
| `APP_ID`            | No       | GitHub App ID for release auth |
| `APP_PRIVATE_KEY`   | No       | GitHub App private key         |
| `REGISTRY_USERNAME` | No       | Docker registry username       |
| `REGISTRY_PASSWORD` | No       | Docker registry password       |

## Outputs

| Output          | Description                     |
| --------------- | ------------------------------- |
| `lint-status`   | Lint result                     |
| `build-status`  | Build result                    |
| `docker-digest` | Docker image digest             |
| `docker-tags`   | Docker image tags               |
| `version`       | Released version                |
| `published`     | Whether a version was published |
