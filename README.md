# homebrew-gstack (deprecated)

This tap has been consolidated into [`juanheyns/homebrew-tap`](https://github.com/juanheyns/homebrew-tap).

## Migrate

```bash
brew uninstall browse browse-agent design 2>/dev/null
brew untap juanheyns/gstack
brew install juanheyns/tap/browse
brew install juanheyns/tap/browse-agent   # optional Claude sidebar
brew install juanheyns/tap/design
```

New releases of `browse`, `browse-agent`, and `design` will publish to `juanheyns/homebrew-tap` only.
