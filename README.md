# wasm-opt-bug

Demo of what seems to be a bug in `cargo wasi`'s invocation of `wasm-opt`: I 
can't seem to disable it for workspace packages.

Output of `./run.sh` on my M1 Mac:

```
$> ./run.sh
Cleaning up first

Building solo-package, a non-workspace package:
   Compiling solo-package v0.1.0 (/Users/verm/remix/wasm-opt-bug/solo-package)
    Finished release [optimized] target(s) in 0.17s
  Optimizing with wasm-opt
output size:
-rw-r--r--  2 verm  staff    61K Jul 17 15:55 target/wasm32-wasi/release/solo-package.wasm

Building solo-package-disabled, a non-workspace package with wasm-opt disabled:
   Compiling solo-package-disabled v0.1.0 (/Users/verm/remix/wasm-opt-bug/solo-package-disabled)
    Finished release [optimized] target(s) in 0.17s
output size:
-rw-r--r--  2 verm  staff    70K Jul 17 15:55 target/wasm32-wasi/release/solo-package-disabled.wasm

Building workspace-package, a workspace package:
   Compiling workspace-package v0.1.0 (/Users/verm/remix/wasm-opt-bug/workspace-package)
    Finished release [optimized] target(s) in 0.18s
  Optimizing with wasm-opt
output size:
-rw-r--r--  2 verm  staff    61K Jul 17 15:55 target/wasm32-wasi/release/workspace-package.wasm

Building workspace-package-disabled, a workspace package with wasm-opt disabled:
   Compiling workspace-package-disabled v0.1.0 (/Users/verm/remix/wasm-opt-bug/workspace-package-disabled)
    Finished release [optimized] target(s) in 0.04s
  Optimizing with wasm-opt
output size:
-rw-r--r--  2 verm  staff    61K Jul 17 15:55 target/wasm32-wasi/release/workspace-package-disabled.wasm
```

Note that disabling `wasm-opt` only seems to work in a non-workspace package.
Setting the same flag in the workspace `Cargo.toml` doesn't seem to work either,
either with `[workspace.metadata]` or `[workspace.package.metadata]`.
