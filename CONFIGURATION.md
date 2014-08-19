# Configuration

Cowl offers multiple ways to resolve preferences:

1. Command-line flags (`cowl -w`)
2. Dotfiles (`.cowl.yml`)
3. Built-in defaults (`DEFAULT_MAX_WIDTH`)

Any command-line flags that are present override the same settings in dotfiles and built-in defaults.

# Command-line flags

Run `cowl -h` or `cowl --help` for a full list, or refer to the source code for `bin/cowl`.

```
$ cowl -h
Usage: cowl [options] [<files>]
    -i, --ignore pattern             Ignore file names matching Ruby regex pattern
    -w, --max-width=                 Maximum column width, either an integer or "unlimited". Default: 80
    -h, --help                       Print usage info
    -v, --version                    Print version info
```

# Dotfiles

Cowl automatically applies any `.cowl.yml` configuration files in the same directory as a file being scanned, or a parent directory (`../.cowl.yml`), up to `$HOME/.cowl.yml`, if any such files exist.

Sample: [.cowl.yml](https://github.com/mcandre/cowl/blob/master/.cowl.yml)

The following (very short) list of keys are available as settings in any `.cowl.yml` file:

## `max_width`

`max_width` may be an integer (e.g. `80`), or `unlimited`.

# Built-in defaults

`max_width` defaults to `80`.
