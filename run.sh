#!/usr/bin/env bash

echo "Cleaning up first"
cargo clean
pushd solo-package &> /dev/null
cargo clean
popd &> /dev/null
pushd solo-package-disabled &> /dev/null
cargo clean
popd &> /dev/null
echo


echo "Building solo-package, a non-workspace package:"
pushd solo-package &> /dev/null
cargo wasi build --release
echo "output size:"
ls -lh target/wasm32-wasi/release/solo-package.wasm
popd &> /dev/null
echo

echo "Building solo-package-disabled, a non-workspace package with wasm-opt disabled:"
pushd solo-package-disabled &> /dev/null
cargo wasi build --release
echo "output size:"
ls -lh target/wasm32-wasi/release/solo-package-disabled.wasm
popd &> /dev/null
echo

echo "Building workspace-package, a workspace package:"
cargo wasi build --release -p workspace-package
echo "output size:"
ls -lh target/wasm32-wasi/release/workspace-package.wasm
echo

echo "Building workspace-package-disabled, a workspace package with wasm-opt disabled:"
cargo wasi build --release -p workspace-package-disabled
echo "output size:"
ls -lh target/wasm32-wasi/release/workspace-package-disabled.wasm

