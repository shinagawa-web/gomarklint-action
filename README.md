# gomarklint-action

Catch broken links, dead heading anchors, and formatting issues in your Markdown documentation — automatically, on every pull request.

## What it checks

- **External links** — detects URLs that return 4xx/5xx or time out
- **Heading fragment links** — catches `[see here](#some-heading)` that break when headings are renamed
- **Formatting** — enforces consistent style across contributors (headings, code fences, emphasis, list markers, and more)

Powered by [gomarklint](https://github.com/shinagawa-web/gomarklint), a fast Markdown linter written in Go.

## Quick Start

**1. Generate a config file** (one-time setup, run locally):

```bash
gomarklint init
```

**2. Add a workflow:**

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
      - uses: shinagawa-web/gomarklint-action@v1
```

The action reads your `.gomarklint.json` config and fails the build when issues are found.

> **Note:** `.gomarklint.json` is required. If it is missing, the action will fail. After generating it, set the `include` field to specify which files or directories to lint:
>
> ```json
> "include": ["README.md", "docs/"]
> ```

## PR Comment

Post lint results as a comment on pull requests. The comment is updated on each run — no duplicates.

```yaml
jobs:
  docs-lint:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write
    steps:
      - uses: actions/checkout@v4
      - uses: shinagawa-web/gomarklint-action@v1
        with:
          comment-on-pr: 'true'
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

## Why not markdownlint-cli2-action?

markdownlint checks formatting only. gomarklint-action also validates external URLs and heading fragment links — the two most common ways documentation silently breaks in production.

| | gomarklint-action | markdownlint-cli2-action |
|---|:---:|:---:|
| Formatting rules | ✅ | ✅ |
| External link checking | ✅ | ❌ |
| Heading fragment links | ✅ | ❌ |
| Single binary (no Node.js) | ✅ | ❌ |
| PR comment | ✅ | ❌ |

## Inputs

| Input | Required | Default | Description |
|---|---|---|---|
| `args` | No | `''` | Arguments to pass to gomarklint |
| `comment-on-pr` | No | `'false'` | Post lint results as a PR comment |
| `github-token` | No | `${{ github.token }}` | GitHub token for posting PR comments |

## License

MIT
