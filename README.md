# gomarklint-action

Lint Markdown files using [gomarklint](https://github.com/shinagawa-web/gomarklint) in GitHub Actions.

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
