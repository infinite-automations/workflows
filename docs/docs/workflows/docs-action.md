# Documentation (Action/Workflow)

Generates documentation for GitHub Actions or reusable workflows using [action-docs](https://github.com/npalm/action-docs).

## Usage

```yaml
jobs:
  docs:
    uses: infinite-automations/workflows/.github/workflows/docs-action.yml@v1.0.0
    with:
      source-file: action.yml
    permissions:
      contents: write
```

## Inputs

| Input           | Type    | Default      | Description                      |
| --------------- | ------- | ------------ | -------------------------------- |
| `dry-run`       | boolean | `false`      | Generate docs but do not commit  |
| `source-file`   | string  | `action.yml` | Path to the action/workflow YAML |
| `readme-file`   | string  | `README.md`  | Path to the readme to update     |
| `toc-level`     | number  | `2`          | TOC heading level                |
| `artifact-name` | string  | `docs`       | Artifact name for generated docs |

## Outputs

| Output    | Description                       |
| --------- | --------------------------------- |
| `changed` | Whether documentation was changed |

## Readme Setup

Add these markers to your readme:

```markdown
<!-- action-docs-header source="action.yml" -->
<!-- action-docs-description source="action.yml" -->
<!-- action-docs-inputs source="action.yml" -->
<!-- action-docs-outputs source="action.yml" -->
<!-- action-docs-runs source="action.yml" -->
```
