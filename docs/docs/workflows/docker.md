# Docker Build & Push

## Inputs

| name | description | type | required | default |
| --- | --- | --- | --- | --- |
| `ref` | <p>Git ref to checkout (empty = checkout action default)</p> | `string` | `false` | `""` |
| `image` | <p>Full image name (e.g. ghcr.io/owner/repo)</p> | `string` | `false` | `ghcr.io/${{ github.repository }}` |
| `context` | <p>Docker build context path</p> | `string` | `false` | `.` |
| `file` | <p>Path to the Dockerfile (relative to context)</p> | `string` | `false` | `""` |
| `tags` | <p>Newline-separated extra tags to apply (in addition to auto-generated tags)</p> | `string` | `false` | `""` |
| `tag-semver` | <p>Apply semver tag pattern (e.g. {{version}})</p> | `string` | `false` | `{{version}}` |
| `registry` | <p>Container registry to authenticate with</p> | `string` | `false` | `ghcr.io` |
| `build-args` | <p>Newline-separated list of build arguments</p> | `string` | `false` | `""` |
| `platforms` | <p>Comma-separated list of target platforms (e.g. linux/amd64,linux/arm64)</p> | `string` | `false` | `""` |
| `cache-from` | <p>Cache source for Docker build</p> | `string` | `false` | `type=gha` |
| `cache-to` | <p>Cache destination for Docker build</p> | `string` | `false` | `type=gha,mode=max` |
| `target` | <p>Docker build target stage</p> | `string` | `false` | `""` |
| `download-artifact-name` | <p>Name of a build artifact to download before building (empty to skip)</p> | `string` | `false` | `""` |
| `download-all-artifacts` | <p>Download all artifacts before building</p> | `boolean` | `false` | `false` |
| `download-artifact-path` | <p>Path to download the artifact to (relative to workspace)</p> | `string` | `false` | `""` |
| `download-artifact-merge-multiple` | <p>Merge multiple artifacts into a single directory</p> | `boolean` | `false` | `true` |
| `download-artifact-continue-on-error` | <p>Continue workflow if artifact download fails</p> | `boolean` | `false` | `false` |
| `push` | <p>Push image to registry after building</p> | `boolean` | `false` | `true` |


## Secrets

| name | description | required |
| --- | --- | --- |
| `REGISTRY_USERNAME` | <p>Registry username (optional, defaults to github.repository_owner)</p> | `false` |
| `REGISTRY_PASSWORD` | <p>Registry password (optional, defaults to GITHUB_TOKEN)</p> | `false` |


## Outputs

| name | description |
| --- | --- |
| `image` | <p>Full image reference with digest</p> |
| `digest` | <p>Image digest</p> |
| `tags` | <p>Applied image tags (newline-separated)</p> |


## Usage

```yaml
jobs:
  job1:
    uses: infinite-automations/workflows/.github/workflows/docker.yml@v1.3.1
    with:
      ref:
      # Git ref to checkout (empty = checkout action default)
      #
      # Type: string
      # Required: false
      # Default: ""

      image:
      # Full image name (e.g. ghcr.io/owner/repo)
      #
      # Type: string
      # Required: false
      # Default: ghcr.io/${{ github.repository }}

      context:
      # Docker build context path
      #
      # Type: string
      # Required: false
      # Default: .

      file:
      # Path to the Dockerfile (relative to context)
      #
      # Type: string
      # Required: false
      # Default: ""

      tags:
      # Newline-separated extra tags to apply (in addition to auto-generated tags)
      #
      # Type: string
      # Required: false
      # Default: ""

      tag-semver:
      # Apply semver tag pattern (e.g. {{version}})
      #
      # Type: string
      # Required: false
      # Default: {{version}}

      registry:
      # Container registry to authenticate with
      #
      # Type: string
      # Required: false
      # Default: ghcr.io

      build-args:
      # Newline-separated list of build arguments
      #
      # Type: string
      # Required: false
      # Default: ""

      platforms:
      # Comma-separated list of target platforms (e.g. linux/amd64,linux/arm64)
      #
      # Type: string
      # Required: false
      # Default: ""

      cache-from:
      # Cache source for Docker build
      #
      # Type: string
      # Required: false
      # Default: type=gha

      cache-to:
      # Cache destination for Docker build
      #
      # Type: string
      # Required: false
      # Default: type=gha,mode=max

      target:
      # Docker build target stage
      #
      # Type: string
      # Required: false
      # Default: ""

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

      push:
      # Push image to registry after building
      #
      # Type: boolean
      # Required: false
      # Default: true
```



