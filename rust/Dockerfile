# Builder for building executables with Rust

FROM docker.io/library/rust:1.53 AS build

ARG TARGETARCH

WORKDIR /workspace

COPY configure-builder .

RUN ./configure-builder

ENV CC=gcc

LABEL "Git commit"=$commit_id
