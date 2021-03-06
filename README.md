# build-tools

This project contains functionality shared between all organization repositories.
It should be added as a submodule to any project that needs it and then included into the project makefile.

The following targets have the same semantics and are [extendable](https://www.gnu.org/software/make/manual/html_node/Double_002dColon.html):
- `build` for packaging an executable
- `check` for static analysis
- `cover` for graphical unit test coverage results
- `format` for code formatting
- `generate` for code generation
- `init` for dependency resolution
- `test` for running unit tests

## devenv

Included by the base makefile.

Adds the `bootstrap` target which sets up the base development environment with common dependencies.
If actions need to be done before or after the bootstrap, they can be added with a `bootstrap.init` and `bootstrap.post` target respectively.

**Note:** *Only MacOS is supported currently.*

## docker

Supplies targets for building containers with Docker.

## docs

Included by the base makefile.

Adds the `documentation` target which renders PlantUML files into PNG.

Adds the `help` target which shows a list of available targets and a short explanation of their usage.
Add a line starting with `#info:` after a make target to include it in the help.

## flutter

Supplies targets for Flutter projects.

## gcloud

Supplies targets for managing Google Cloud emulators for local development.

## go

Supplies targets for Go projects.

## postgres

Supplies targets for managing a local development Postgres database.

## rust

Supplies targets for Rust projects.
