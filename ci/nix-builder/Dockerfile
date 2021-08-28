# Dockerfile to create an environment that contains the Nix package manager.
# Based on https://github.com/NixOS/docker/tree/b9a902151045d072f2887cdd406ce674fa730cf2

FROM alpine

ARG NIX_VERSION=2.3.15

RUN wget https://nixos.org/releases/nix/nix-${NIX_VERSION}/nix-${NIX_VERSION}-$(uname -m)-linux.tar.xz \
  && tar xf nix-${NIX_VERSION}-$(uname -m)-linux.tar.xz \
  && addgroup -g 30000 -S nixbld \
  && for i in $(seq 1 30); do adduser -S -D -h /var/empty -g "Nix build user $i" -u $((30000 + i)) -G nixbld nixbld$i ; done \
  && mkdir -m 0755 /etc/nix \
  && echo 'filter-syscalls = false' > /etc/nix/nix.conf \
  && echo 'sandbox = false' >> /etc/nix/nix.conf \
  && mkdir -m 0755 /nix && USER=root sh nix-${NIX_VERSION}-$(uname -m)-linux/install \
  && ln -s /nix/var/nix/profiles/default/etc/profile.d/nix.sh /etc/profile.d/ \
  && rm -r /nix-${NIX_VERSION}-$(uname -m)-linux* \
  && rm -rf /var/cache/apk/* \
  && /nix/var/nix/profiles/default/bin/nix-collect-garbage --delete-old \
  && /nix/var/nix/profiles/default/bin/nix-store --optimise \
  && /nix/var/nix/profiles/default/bin/nix-store --verify --check-contents

ENV \
    ENV=/etc/profile \
    GIT_SSL_CAINFO=/etc/ssl/certs/ca-certificates.crt \
    NIX_PATH=/nix/var/nix/profiles/per-user/root/channels \
    NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    PATH=/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/bin:/sbin:/usr/bin:/usr/sbin \
    USER=root

# Install shared base packages
COPY basepkgs.nix basepkgs.nix
COPY shell.nix shell.nix
RUN nix-shell --run "echo Installed base packages" \
  && rm basepkgs.nix shell.nix
