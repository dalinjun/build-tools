COVERAGE_RESULT=cover.out

build: test #info: Build Go executable
	@CGO_ENABLED=0 GOOS=$$TARGETOS GOARCH=$$TARGETARCH $(BUILD_COMMAND)

check: generate #info: Run static analysis
	@golangci-lint run ./...

cover: test #info: Show coverage report in browser
	@go tool cover -html=$(COVERAGE_RESULT)

format: #info: Format Go files
	@go fmt ./...

generate:
	@go generate ./...

init:
	@go mod download

test: generate format #info: Run unit tests
	@go test ./... -coverprofile $(COVERAGE_RESULT)
