# Builder for building go executables

FROM --platform=$BUILDPLATFORM docker.io/library/debian:stable-slim AS build

ARG BUILDPLATFORM

ARG TARGETARCH

RUN apt update && apt install -y curl

WORKDIR /workspace

COPY configure-builder .

RUN ./configure-builder

FROM docker.io/library/golang:1.17

COPY --from=build /workspace/golangci-lint /go/bin/

LABEL "Git commit"=$commit_id
