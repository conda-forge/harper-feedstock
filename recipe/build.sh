#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat
export CFLAGS="${CFLAGS} -D_BSD_SOURCE"

cargo-bundle-licenses \
    --format yaml \
    --output THIRDPARTY.yml

# build statically linked binary with Rust
cargo install --bins --no-track --locked --root ${PREFIX} --path harper-cli
cargo install --bins --no-track --locked --root ${PREFIX} --path harper-ls
