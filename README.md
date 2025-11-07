# gomarklint-action

Lint Markdown files using [gomarklint](https://github.com/shinagawa-web/gomarklint) in GitHub Actions.
Automate documentation quality checks with minimal setup.

## Why

Documentation often drifts out of sync: structure breaks, links rot, anchors vanish.
This Action enables teams to treat docs like code—fast feedback in pull requests, consistent enforcement in CI, no more silent failures.

## Features

- One-line integration into existing workflows
- Respects .gomarklint.json config (same rules as local linting)
- Fails builds when documentation issues are detected
- JSON output support for advanced workflows
- Lightweight: Docker / Shell entrypoint, no heavy dependencies

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

## Quick Start

Create a workflow:

```yaml
# .github/workflows/docs-lint.yml
name: Lint Markdown

on:
  pull_request:
    paths:
      - '**/*.md'

jobs:
  docs-lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-go@v5
        with:
          go-version: '1.23'

      # Runs gomarklint using your .gomarklint.json config
      - uses: shinagawa-web/gomarklint-action@v1
```

## License

MIT
