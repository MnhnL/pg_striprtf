# pg_striprtf

Remove or strip Rich Text Formatting (RTF) in PostgreSQL. This code is
a port of the python project
[striprtf](https://github.com/joshy/striprtf/) project by *joshy* to
PostgreSQL. Many thanks for this code.

Once your text has been run thourgh the strip function, no formatting
text will be left over, only the visible text will stay.

This project is implemented in pl/pgsql, the postgres native
imperative programming language. The function uses regexp and iterates
over single characters with many conditionals and might therefore not
be the fastest. Processing 75.000 short (144 char average) texts takes
around 70s on a decent machine, amounting to roughly 1ms per text.

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
