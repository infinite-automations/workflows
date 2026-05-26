# CI (.NET)

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout in child workflows (empty = checkout action default)</p> | `string` | `false` | `""` |
| `dry-run` | <p>Run in dry-run mode (lint and build run normally, release is dry-run)</p> | `boolean` | `false` | `false` |
| `skip-lint` | <p>Skip the lint job (useful when lint is run separately)</p> | `boolean` | `false` | `false` |
| `dotnet-version` | <p>The .NET SDK version to install</p> | `string` | `false` | `""` |
| `working-directory` | <p>Working directory containing the .NET solution/project</p> | `string` | `false` | `.` |
| `build-configuration` | <p>Build configuration (e.g. Release, Debug)</p> | `string` | `false` | `Release` |
| `publish-output` | <p>Output directory for dotnet publish (relative to workspace)</p> | `string` | `false` | `app` |
| `test-reporter` | <p>Enable test result reporting (requires checks: write)</p> | `boolean` | `false` | `true` |
| `artifact-name` | <p>Name for the build artifact (shared between build and docker jobs)</p> | `string` | `false` | `build` |
| `docker-image` | <p>Full Docker image name (e.g. ghcr.io/owner/repo)</p> | `string` | `false` | `ghcr.io/${{ github.repository }}` |
| `docker-context` | <p>Docker build context path</p> | `string` | `false` | `.` |
| `docker-file` | <p>Path to the Dockerfile</p> | `string` | `false` | `""` |
| `docker-target` | <p>Docker build target stage</p> | `string` | `false` | `""` |
| `docker-registry` | <p>Container registry to authenticate with</p> | `string` | `false` | `ghcr.io` |
| `docker-build-args` | <p>Newline-separated list of Docker build arguments</p> | `string` | `false` | `""` |
| `docker-platforms` | <p>Comma-separated list of target platforms (e.g. linux/amd64,linux/arm64)</p> | `string` | `false` | `""` |
| `docker-tags` | <p>Newline-separated extra tags to apply to the Docker image</p> | `string` | `false` | `""` |
| `docker-tag-semver` | <p>Docker semver tag pattern (e.g. {{version}})</p> | `string` | `false` | `{{version}}` |
| `docker-cache-from` | <p>Docker build cache source</p> | `string` | `false` | `type=gha` |
| `docker-cache-to` | <p>Docker build cache destination</p> | `string` | `false` | `type=gha,mode=max` |
| `skip-docker` | <p>Skip the Docker build job</p> | `boolean` | `false` | `false` |
| `semrel-extra-plugins` | <p>Newline-separated list of extra semantic-release plugins</p> | `string` | `false` | `""` |
| `node-version` | <p>Node.js version to use</p> | `string` | `false` | `lts/*` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `APP_ID` | <p>GitHub App ID for release authentication (optional)</p> | `false` |
| `APP_PRIVATE_KEY` | <p>GitHub App private key for release authentication (optional)</p> | `false` |
| `REGISTRY_USERNAME` | <p>Docker registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Docker registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `lint-status` | <p>Lint result status</p> |
| `build-status` | <p>Build result status</p> |
| `docker-digest` | <p>Docker image digest</p> |
| `docker-tags` | <p>Docker image tags</p> |
| `version` | <p>Released version</p> |
| `published` | <p>Whether a new version was published</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/ci-dotnet.yml@vMAJOR
    with:
      ref:
      # Git ref to checkout in child workflows (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      dry-run:
      # Run in dry-run mode (lint and build run normally, release is dry-run)
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
      # Default: .

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

      test-reporter:
      # Enable test result reporting (requires checks: write)
      #
      # Type: boolean
      # Required: false
      # Default: true

      artifact-name:
      # Name for the build artifact (shared between build and docker jobs)
      #
      # Type: string
      # Required: false
      # Default: build

      docker-image:
      # Full Docker image name (e.g. ghcr.io/owner/repo)
      #
      # Type: string
      # Required: false
      # Default: ghcr.io/${{ github.repository }}

      docker-context:
      # Docker build context path
      #
      # Type: string
      # Required: false
      # Default: .

      docker-file:
      # Path to the Dockerfile
      #
      # Type: string
      # Required: false
      # Default: ""

      docker-target:
      # Docker build target stage
      #
      # Type: string
      # Required: false
      # Default: ""

      docker-registry:
      # Container registry to authenticate with
      #
      # Type: string
      # Required: false
      # Default: ghcr.io

      docker-build-args:
      # Newline-separated list of Docker build arguments
      #
      # Type: string
      # Required: false
      # Default: ""

      docker-platforms:
      # Comma-separated list of target platforms (e.g. linux/amd64,linux/arm64)
      #
      # Type: string
      # Required: false
      # Default: ""

      docker-tags:
      # Newline-separated extra tags to apply to the Docker image
      #
      # Type: string
      # Required: false
      # Default: ""

      docker-tag-semver:
      # Docker semver tag pattern (e.g. {{version}})
      #
      # Type: string
      # Required: false
      # Default: {{version}}

      docker-cache-from:
      # Docker build cache source
      #
      # Type: string
      # Required: false
      # Default: type=gha

      docker-cache-to:
      # Docker build cache destination
      #
      # Type: string
      # Required: false
      # Default: type=gha,mode=max

      skip-docker:
      # Skip the Docker build job
      #
      # Type: boolean
      # Required: false
      # Default: false

      semrel-extra-plugins:
      # Newline-separated list of extra semantic-release plugins
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
```



