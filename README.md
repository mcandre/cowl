# cowl - column width linter

`cowl` helps you keep your source code / text in a terminal-friendly 80-column width.

# EXAMPLES

```console
$ cowl examples/
examples/hello.bf:3:++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.

$ cat examples/hello.bf | cowl
stdin:3:++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.

$ wc -c examples/hello.bf
     158 examples/hello.bf

$ cowl -w 160 examples/hello.bf
$

$ cowl -i '*.bf' examples/
$

$ cowl -h
Usage: cowl [options] [<files>|-]
    -i, --ignore pattern             Ignore file patterns (fnmatch)
    -w, --max-width=                 Maximum column width, either an integer or "unlimited". Default: 80
    -s, --stat                       Output in STAT
    -h, --help                       Print usage info
    -v, --version                    Print version info
```

# HOMEPAGE

https://github.com/mcandre/cowl

# RUBYGEMS

https://rubygems.org/gems/cowl

# ABOUT

Cowl is a command line program for identifying text lines that are considered too long, wider than the conventional column width `80` or so.

cowl is a shell wrapper around the traditional GNU [grep](http://www.gnu.org/software/grep/) backend, presenting a frontend similar to modern linters like [Reek](https://github.com/troessner/reek/wiki) and [JSHint](http://jshint.com/).

* Recursive file scanning, like `jshint .`
* Optional ignore patterns, like `.gitignore`
* Configuration via per-project and per-user [dotfiles](https://github.com/mcandre/cowl/blob/master/CONFIGURE.md#dotfiles)
* Install via a standard programming language package manager

# REQUIREMENTS

* [ruby](https://www.ruby-lang.org/) 2.7+
* [grep](http://www.gnu.org/software/grep/)

## Optional

* [wc](http://linux.die.net/man/1/wc) can help determine the longest line in a file
* [GNU findutils](https://www.gnu.org/software/findutils/)
* [stank](https://github.com/mcandre/stank) (e.g. `go get github.com/mcandre/stank/...`)
* [Python](https://www.python.org) 3+ (for yamllint)
* [Node.js](https://nodejs.org/en/) (for eclint)

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```console
$ gem install cowl
```

# CONFIGURE

See [CONFIGURE.md](https://github.com/mcandre/cowl/blob/master/CONFIGURE.md) for details.

# LICENSE

FreeBSD

# DEVELOPMENT

## Testing

Keep the interface working:

```console
$ cucumber
```

## Linting

Keep the code tidy:

```console
$ rake lint
```
