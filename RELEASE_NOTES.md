# Release Notes

This is a BrightDigit fork of [Plot](https://github.com/JohnSundell/Plot) by John Sundell,
maintained for the BrightDigit site toolchain. Original work © 2019 John Sundell; modifications
© 2026 BrightDigit. Distributed under the original MIT License (see `LICENSE` and `NOTICE`).

## Unreleased

Fork bring-up on the BrightDigit Swift 6.4 toolchain (from brightdigit/Plot PR #1,
"Sync subrepo branch brightdigit-com-260406").

### Toolchain & CI
- Migrated to the BrightDigit Swift 6.4 CI template (`.github/workflows/Plot.yml`): Ubuntu
  (nightly-6.4 container, with wasm/wasm-embedded variants), macOS, Windows, Apple-platform
  simulator suite, and Android legs, plus STRICT linting.
- Added supporting CI workflows (Claude code review, unsafe-flags check, cache cleanup,
  source-compat) and the `setup-tools` composite action.
- Pinned the toolchain via `.swift-version`; dev container image set to
  `swiftlang/swift:nightly-6.4.x-noble`.

### Tooling & configuration
- Added `.mise.toml`, `.swift-format`, `.swiftlint.yml`, `.periphery.yml`, `codecov.yml`,
  and `Scripts/lint.sh` / `Scripts/header.sh` for the standardized lint/format pipeline.
- Normalized `.spi.yml` for Swift Package Index documentation builds.
- Updated `Package.swift` for the fork build.

### Source
- Reorganized the `Plot` module sources (API + Internal) and `PlotTests` to satisfy strict
  concurrency and the fork's lint configuration. John Sundell's original MIT copyright headers
  are preserved verbatim in every source file.
