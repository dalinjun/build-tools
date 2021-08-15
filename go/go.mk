COVERAGE_RESULT=cover.out

build.containerized:
	@CGO_ENABLED=1 GOOS=linux GOARCH=$$BUILDARCH $(BUILD_COMMAND)

check: #info: Run static analysis
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
