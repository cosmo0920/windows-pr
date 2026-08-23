[![Ruby](https://github.com/cosmo0920/windows-pr/actions/workflows/ci.yml/badge.svg)](https://github.com/cosmo0920/windows-pr/actions/workflows/ci.yml)

# windows-pr

`windows-pr` is a collection of Windows API functions and constants predefined
for Ruby through its standard [`Fiddle`](https://ruby-doc.org/stdlib/libdoc/fiddle/rdoc/Fiddle.html)
foreign-function interface. The `pr` stands for "Pure Ruby."

Daniel J. Berger created the project with contributions from Park Heesob. In
2016, maintenance passed to [Hiroshi Hatake](https://github.com/cosmo0920).

## Installation

Install the gem:

```console
gem install windows-pr
```

Or add it to your `Gemfile`:

```ruby
gem "windows-pr"
```

This library is intended to run on Windows. It calls native Windows DLLs and is
not a cross-platform implementation of the Windows API.

## Usage

Require the module for the part of the Windows API that you need, then include
it in your class or module:

```ruby
require "windows/path"

class Foo
  include Windows::Path

  def root?(path)
    PathIsRoot(path)
  end
end

Foo.new.root?("C:\\") # => true
```

Source files group related functions and constants by topic. For example,
`windows/clipboard` provides clipboard functions such as `CloseClipboard` and
constants such as `CF_TEXT` and `CF_BITMAP`. See the files under `lib/windows`
for the available modules.

## API conventions

Each module defines callable objects for the Windows
functions it exposes. Requiring `windows/path`, for example, makes constants
such as `PathIsRoot` and `PathIsUNC` available within `Windows::Path`.

Convenience wrapper methods let you call a function without an explicit
explicit `call` method:

```ruby
PathIsRoot.call(path) # Fiddle function object
PathIsRoot(path)      # wrapper method
```

The capitalization matters: `PathIsRoot` refers to the constant, while
`PathIsRoot()` invokes the wrapper method. Wrappers for lowercase C runtime
functions are also lowercase, so `Memcpy.call(dest, src, size)` can be written
as `memcpy(dest, src, size)`.

Wrappers for functions declared with a Boolean return type convert the result
to `true` or `false`. MSVCRT functions returning an integer retain the integer
result because it may carry more information than success or failure.

Functions and constants are private to their modules. Include the relevant
module where you intend to use them.

## ANSI and wide-character functions

Where Windows provides both variants, modules expose explicit ANSI (`A`) and
wide-character (`W`) functions. An unqualified function name uses the ANSI
variant; call the `W` variant explicitly when working with wide strings.

`Windows::Unicode` provides `multi_to_wide` and `wide_to_multi` helpers. Unless
a code page is supplied, they select `CP_UTF8` for a UTF-8-encoded Ruby string
and `CP_ACP` otherwise.

## Platform-dependent functions

Windows versions and installed DLLs do not all export the same functions. Test
for an optional wrapper before calling it:

```ruby
if defined?(AttachConsole)
  AttachConsole(process_id)
end
```

## Testing and contributing

The library covers a large API surface, and not every declaration has a test.
Bug reports and pull requests are especially useful when they include a small
reproduction for an incorrect function prototype or constant value.

On Windows, install the development dependencies and run the test suite with:

```console
bundle install
bundle exec rake test:all
```

Report issues on the [maintained project
repository](https://github.com/cosmo0920/windows-pr/issues). The original
repository remains at [`djberg96/windows-pr`](https://github.com/djberg96/windows-pr).

## License

This project is licensed under the Artistic License 2.0.

It is provided "as is," without express or implied warranties, including the
implied warranties of merchantability and fitness for a particular purpose.

## Authors and maintainers

- Daniel J. Berger - original author, 2006-2014
- Park Heesob - contributor
- Hiroshi Hatake - maintainer since 2016

Copyright (C) 2006-2014 Daniel J. Berger and (C) 2016-2020 Hiroshi Hatake. All
rights reserved.
