build:: #info: Build Rust executable
	@$(PROJECT_ROOT)/rust/run-cargo build

check:: #info: Run static analysis
	@cargo clippy --release -- --deny warnings

format:: #info: Format source code
	@cargo fmt

generate::

test:: #info: Run unit tests
	@$(PROJECT_ROOT)/rust/run-cargo test
