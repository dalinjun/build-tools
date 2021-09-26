COVERAGE_RESULT=cover.out

build:: #info: Build executable package
	@CGO_ENABLED=0 GOOS=$$TARGETOS GOARCH=$$TARGETARCH $(BUILD_COMMAND)

check:: #info: Run static analysis
	@golangci-lint run --timeout=5m0s ./...

cover:: #info: Show coverage report in browser
	@go tool cover -html=$(COVERAGE_RESULT)

format:: #info: Format source code files
	@go fmt ./...

generate:: #info: Generate intermediate source code
	@go generate ./...

init:: #info: Download dependencies
	@go mod download

test:: #info: Run unit tests
	@go test ./... -coverprofile $(COVERAGE_RESULT)
