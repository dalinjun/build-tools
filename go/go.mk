COVERAGE_RESULT=cover.out

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
