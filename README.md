# build-tools

This project contains functionality shared between all repositories.
It should be added as a submodule to any project that needs it and then included into the project makefile.

The following targets are stable:
- `check` for static analysis
- `cover` for graphical unit test coverage results
- `format` for code formatting
- `generate` for code generation
- `init` for dependency resolution
- `test` for running unit tests

## go

Supplies targets for Go projects.

## help

Included by the base makefile.

Shows a list of available targets and a short explanation of their usage.
Add a line starting with `#info:` after a make target to include it in the help.
