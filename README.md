# pg_striprtf

Remove or strip Rich Text Formatting (RTF) in PostgreSQL. This code is
a port of the python project [striprtf](https://github.com/joshy/striprtf/)
project by *joshy* to PostgreSQL. Many thanks for this code.

*Beware*: This code only implements the features of RTF that are
 necessary for our application. The implementation is incomplete and
 broken to some extent.

## Install

Run the content of `pg_striprtf.sql` in the schema of your choice to
install the `striprtf` function.

## Useage

Pass the rtf formatted text to the function `striprtf` and receive
text with RTF formatting removed.

## Run tests

There is a short test suite available in the `test.sql` file. It uses
the `pg_tap` test framework. Use `pg_prove` to run the tests after
having installed the pgtap extension using your package manager and
having created the extension in the schema of choice.

## Contributing

Contributions are always welcome. Please submit a pull request if you
have changes that improve on the current version.
