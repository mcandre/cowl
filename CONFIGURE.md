# Configuration

Cowl offers multiple ways to resolve preferences:

1. Command-line flags (`cowl -i`, `cowl -w`)
2. Dotfiles (`.cowlignore`, `.cowlrc.yml`)
3. Built-in defaults (`DEFAULT_IGNORES`, `DEFAULT_MAX_WIDTH`)

Any command-line flags that are present override the same settings in dotfiles and built-in defaults.

# Command-line flags

Run `cowl -h` or `cowl --help` for a full list, or refer to the source code for `bin/cowl`.

```console
$ cowl -h
Usage: cowl [options] [<files>]
    -i, --ignore pattern             Ignore file patterns (fnmatch)
    -w, --max-width=                 Maximum column width, either an integer or "unlimited". Default: 80
    -h, --help                       Print usage info
    -v, --version                    Print version info
```

# Dotfiles

Cowl automatically applies any `.cowlignore` and/or `.cowlrc.yml` configuration files in the same directory as a file being scanned, or a parent directory (`../.cowlignore`, `../.cowlrc.yml`), up to `$HOME/.cowlignore`, `$HOME/.cowlrc.yml`, if any such files exist.

## `.cowlignore`

Samples:

* [cowl/.cowlignore](https://github.com/mcandre/cowl/blob/master/.cowlignore)
* [examples/.cowlignore](https://github.com/mcandre/cowl/blob/master/examples/.cowlignore)

A `.cowlignore` may contain Ruby regex patterns of files and/or folders to exclude from scanning, one pattern per line.

## `.cowlrc.yml`

Samples:

* [cowl/.cowlrc.yml](https://github.com/mcandre/cowl/blob/master/.cowlrc.yml)
* [unwrapped-books/.cowlrc.yml](https://github.com/mcandre/cowl/blob/master/examples/unwrapped-books/.cowlrc.yml)

`.cowlrc.yml` may contain a number of keys:

* `max_width` may be an integer (e.g. `80`), or `unlimited`.

# Built-in defaults

`max_width` defaults to `80`.
