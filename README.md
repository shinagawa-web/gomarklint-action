# gomarklint-action

Lint Markdown files using [gomarklint](https://github.com/shinagawa-web/gomarklint) in GitHub Actions.

## 🚀 Prerequisites

Before using this action, please generate a `.gomarklint.json` config file with:

```bash
gomarklint init
```


This config file is required. If it is missing, the action will fail.

See the [gomarklint documentation](https://github.com/shinagawa-web/gomarklint/blob/main/README.md) for details.

> Tip: After generating .gomarklint.json, customize the include field to specify which directories or files should be linted.
For example:


```json
"include": [
  "README.md",
  "docs/"
]
```

## Usage

```yaml
- uses: shinagawa-web/gomarklint-action@v1
```

## License

MIT
