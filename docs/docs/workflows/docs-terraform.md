# Documentation (Terraform)

Generates documentation for Terraform modules using [terraform-docs](https://github.com/terraform-docs/gh-actions).

## Usage

```yaml
jobs:
  docs:
    uses: infinite-automations/workflows/.github/workflows/docs-terraform.yml@v1.0.0
    with:
      working-dir: ".,modules/vpc,examples/basic"
    permissions:
      contents: write
```

## Inputs

| Input           | Type    | Default     | Description                           |
| --------------- | ------- | ----------- | ------------------------------------- |
| `dry-run`       | boolean | `false`     | Generate docs but do not commit       |
| `working-dir`   | string  | `.`         | Comma-separated list of directories   |
| `output-file`   | string  | `README.md` | Output filename                       |
| `output-method` | string  | `inject`    | Output method (`inject` or `replace`) |
| `artifact-name` | string  | `docs`      | Artifact name for generated docs      |

## Outputs

| Output    | Description                       |
| --------- | --------------------------------- |
| `changed` | Whether documentation was changed |
