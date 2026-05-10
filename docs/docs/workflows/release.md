# Release

Runs [semantic-release](https://github.com/semantic-release/semantic-release) via [cycjimmy/semantic-release-action](https://github.com/cycjimmy/semantic-release-action).

Supports authentication via GitHub App token (preferred) or `GITHUB_TOKEN` fallback.

## Usage

```yaml
jobs:
  release:
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

### For GitHub Actions

Pass `semantic-release-major-tag` and `semantic-release-replace-plugin` via `extra-plugins` to automatically update major version tags (`v1`, `v2`, …) and version references in documentation:

```yaml
jobs:
  release:
    uses: infinite-automations/workflows/.github/workflows/release.yml@v1.0.0
    with:
      dry-run: ${{ github.event_name == 'pull_request' }}
      extra-plugins: |
        conventional-changelog-conventionalcommits
        semantic-release-major-tag
        semantic-release-replace-plugin
    secrets:
      APP_ID: ${{ secrets.APP_ID_SEMREL }}
      APP_PRIVATE_KEY: ${{ secrets.APP_KEY_SEMREL }}
    permissions:
      contents: write
      issues: write
      pull-requests: write
```

## Inputs

| Input           | Type    | Default                                      | Description                    |
| --------------- | ------- | -------------------------------------------- | ------------------------------ |
| `dry-run`       | boolean | `false`                                      | Run in dry-run mode            |
| `extra-plugins` | string  | `conventional-changelog-conventionalcommits` | Extra semantic-release plugins |
| `node-version`  | string  | `lts/*`                                      | Node.js version                |

## Secrets

| Secret            | Required | Description                                  |
| ----------------- | -------- | -------------------------------------------- |
| `APP_ID`          | No       | GitHub App ID (falls back to `GITHUB_TOKEN`) |
| `APP_PRIVATE_KEY` | No       | GitHub App private key                       |

## Outputs

| Output      | Description                         |
| ----------- | ----------------------------------- |
| `version`   | Released version                    |
| `published` | Whether a new version was published |
| `major`     | Major version number                |
| `minor`     | Minor version number                |
| `patch`     | Patch version number                |
