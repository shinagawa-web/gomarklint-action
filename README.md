# gomarklint-action

Lint Markdown files using [gomarklint](https://github.com/shinagawa-web/gomarklint) in GitHub Actions.
## 🚀 Prerequisites

Before using this action, please generate a `.gomarklint.json` config file with:

```bash
gomarklint init
```

This config file is required. If it is missing, the action will fail.

See the [gomarklint documentation](https://github.com/shinagawa-web/gomarklint/blob/main/README.md) for details.

## Usage

```yaml
- uses: shinagawa-web/gomarklint-action@v1
  with:
    args: '.'
```

## Inputs

| Name | Description                      | Default |
| ---- | -------------------------------- | ------- |
| args | Arguments passed to `gomarklint` | `.`     |

## License

MIT
