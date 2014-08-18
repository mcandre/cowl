# cowl - column width linter

# HOMEPAGE

https://github.com/mcandre/cowl

# RUBYGEMS

https://rubygems.org/gems/cowl

# ABOUT

Cowl is a command line program for identifying text lines that are considered too long, wider than the conventional column width `80` or so.

cowl is a shell wrapper around the traditional GNU [grep](http://www.gnu.org/software/grep/) backend, presenting a frontend similar to modern linters like [Reek](https://github.com/troessner/reek/wiki) and [JSHint](http://jshint.com/).

* Recursive file search by default
* Optional ignore patterns
* Install via a standard programming language package manager

# EXAMPLE

```
$ cowl examples/
examples/hello.bf:3:++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.

$ wc -L examples/hello.bf
106 examples/hello.bf
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2+
* [grep](http://www.gnu.org/software/grep/) (often built-in, or provided by [git](http://git-scm.com/))

E.g., Windows users can `chocolatey install git`.

## Optional

* [wc](http://linux.die.net/man/1/wc) can help determine the longest line in a file

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```
$ gem install cowl
```

# LICENSE

FreeBSD

# DEVELOPMENT

## Testing

Keep the interface working:

```
$ cucumber
```

## Linting

Keep the code tidy:

```
$ rake lint
```

## Git Hooks

See `hooks/`.
