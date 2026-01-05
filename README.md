# make-desktop

`make-desktop` is a simple program that writes out a .desktop file to `~/.local/share/applications` so that you don't have to do it all yourself.

## Installation

to install, run:

``` sh
git clone https://github.com/elliethepuppy/make-desktop.git && cd make-desktop
```
then just run:

``` sh
crystal build src/main.cr -o build/make-desktop --release --no-debug && cp build/make-desktop ~/.local/bin
```

this will clone the repository and move you into the directory, then builds the program at `build/make-desktop`. the final step is to copy it into your PATH in some way. i find `~/.local/bin` to be the easiest, but if you just want to add the build dir to your PATH, that's up to you

## Usage

usage is straightforward. from anywhere, call `make-desktop [flags]`
valid flags are:

```
-e PROG, --exe=PROG,      sets the executable

-n NAME, --name=NAME,     sets the program name

-d DIR, --dir=DIR,        sets the directory where the executable is located

-m MIME, --mime=MIME,     sets the mime type of the program (optional)

-h, --help,               displays a help message

-v, --version,            displays the version number
```

## Development

honestly i just never know what to put here. i don't think i could tell you how to improve upon this literal single function. if you can, you know that. i never would. just do it.

## Contributing

1. Fork it (<https://github.com/elliethepuppy/make-desktop/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ellie](https://github.com/elliethepuppy) - creator and maintainer
