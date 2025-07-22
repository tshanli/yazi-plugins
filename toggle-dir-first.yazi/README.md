# toggle-dir-first.yazi

Toggle the "directory first" sorting

## Installation

```sh
ya pkg add tshanli/yazi-plugins:toggle-dir-first
```

## Configuration

Add to your `keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = [";", "d"]
run = "plugin toggle-dir-first"

