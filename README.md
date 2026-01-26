# Jkorb Personal

## How do I install these formulae?

`brew install jkorb/personal/<formula>`

Or `brew tap jkorb/personal` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "jkorb/personal"
brew "<formula>"
```

## Why this tap

This tap is mostly for my macOS migration and for keeping a paper trail of why
something lives here instead of `homebrew/core` or `homebrew/cask`.

## What’s inside (and why)

- `alacritty` (cask)
  - Reason: upstream does not sign the macOS build with an Apple Developer ID,
    and Homebrew/cask has marked it deprecated due to Gatekeeper requirements.
    A Homebrew maintainer suggested running a custom tap, and the Alacritty
    maintainer noted they do not use macOS and won’t sign for Apple.
  - Install note: this name conflicts with `homebrew/cask/alacritty`, so install
    with the tap-qualified name (e.g., `brew install jkorb/personal/alacritty`).
  - Gatekeeper note: the app is not notarized, so macOS will block first launch.
    Open it once, then allow it in System Settings > Privacy & Security.
- `browserpass` (formula)
  - Reason: the upstream Homebrew tap (amar1729/formulae) is outdated, so this
    keeps the native host current for macOS.
  - Install note: after install, run the browser host configuration from the
    installed Makefile (see caveats printed by `brew`).
- `davmail` (formula)
  - Reason: the core formula’s service runs on a 5‑minute interval without a
    config; this tap keeps it running with a user config in
    `$XDG_CONFIG_HOME/davmail/davmail.properties` (fallback: `~/.config/...`).
  - Note: this duplicates `homebrew/core`’s `davmail` formula; use the
    tap‑qualified name to avoid ambiguity (e.g., `brew install jkorb/personal/davmail`).
- `nnn-nerd` (formula)
  - Reason: `nnn` with Nerd Font icon support (`O_NERD=1`) enabled at build time.
  - Note: this duplicates `homebrew/core`’s `nnn` formula; install with
    `brew install jkorb/personal/nnn-nerd`.
- `khal` (formula)
  - Reason: testing a newer `urwid` (3.0.4) than the core formula to fix
    breakage; built from GitHub tarball with a setuptools-scm version hint.
  - Note: this duplicates `homebrew/core`’s `khal` formula; install with
    `brew install jkorb/personal/khal`.
- `lua@5.1` (formula)
  - Reason: install Lua 5.1 from source for compatibility with legacy tooling.
  - Note: versioned formula; install with `brew install jkorb/personal/lua@5.1`.

## References

- https://github.com/alacritty/alacritty/issues/8749

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
