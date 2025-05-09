set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

:: check licenses
cargo-bundle-licenses ^
    --format yaml ^
    --output THIRDPARTY.yml || goto :error

:: build statically linked binary with Rust
cargo install --no-track --locked --root %LIBRARY_PREFIX% --path harper-cli || goto :error
cargo install --no-track --locked --root %LIBRARY_PREFIX% --path harper-ls || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
