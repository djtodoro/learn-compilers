# Mojo advanced compiler track

An implementation-oriented guide to Mojo compilation and heterogeneous execution,
for readers familiar with SSA, MLIR, LLVM, and basic GPU programming.

- [Read the guide](MojoAdvanced.pdf)
- [LaTeX source](MojoAdvanced.tex)
- [CPU specialization example](examples/specialization.mojo)
- [GPU lifecycle example](examples/gpu_hello.mojo)

## Coverage

Frontend and LIT semantics; ownership and lifetime checking; parametric KGEN,
POP, HLCF, and CO; elaboration and materialization; post-elaboration optimization;
`KGENCompiler`, `ObjectCompiler`, target backends and LLVM lowering; AOT/JIT and
caches; compiler and runtime Driver layers; `DeviceContext`, `DeviceFunction`,
buffers, streams, and AsyncRT; an end-to-end AI kernel walkthrough; inspection
labs, performance methodology, source anchors, and review questions.

The LIT dialect and LLVM's `lit` test runner are explicitly distinguished.
Schematic IR and vector-add pseudocode are marked as such.

## Baseline and prerequisites

Internal source references use Modular commit
`64df2ed834df1e35d2aba25cd204a8b61ecffe6a`. Source paths are relative to that
checkout. They are implementation details, not stable SDK contracts.
Public documentation was checked on September 14, 2026.

Use a matching nightly Mojo SDK. The GPU example additionally needs the MAX
Mojo package and a supported GPU/runtime installation. No dependency version is
pinned here because the source snapshot and installed SDK must be matched.

## Build the guide

Install a LaTeX distribution with `latexmk`, pdfLaTeX, and the packages listed in
`MojoAdvanced.tex` (including TikZ, listings, and Latin Modern). Then run:

```sh
cd ai-compilers/mojo
make pdf
```

The equivalent command is:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error MojoAdvanced.tex
```

`make clean` removes auxiliary LaTeX files and preserves the generated PDF.
The example files are included directly in the guide at build time.

## Run the examples

From this folder, after activating the matching SDK environment:

```sh
mojo --version
mojo run examples/specialization.mojo
mojo run examples/gpu_hello.mojo
```

The CPU example prints `11`. The GPU example prints four thread lines covering
indices 0–3 in unspecified order, followed by `complete`. It tests launch and
completion behavior, not performance. The guide provides LLVM/assembly emission
commands and source-level inspection exercises.

## Validation

The PDF is built with `latexmk` and visually reviewed after rendering.
Mojo execution was not validated: no matching SDK was available on PATH. A cached
March 2026 compiler (`0.26.3.0.dev2026031705`) reported its version but crashed
when attempting the CPU example. GPU execution was not attempted with that
mismatched toolchain. The GPU example follows the inspected DeviceContext source
documentation. Rerun both examples with the matching SDK.
