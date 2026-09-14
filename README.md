# Learn Compilers

Course material for compiler-oriented learning tracks focused on AI/compiler infrastructure.

## Layout

- [`ai-compilers/xdsl/`](ai-compilers/xdsl/)
  xDSL course source and generated PDF.
- [`ai-compilers/iree/`](ai-compilers/iree/)
  Beginner and advanced IREE course sources and generated PDFs.
- [`ai-compilers/mojo/`](ai-compilers/mojo/)
  Advanced Mojo overview: LIT and KGEN phases, elaboration, LLVM lowering,
  ObjectCompiler, Driver layers, DeviceContext, and heterogeneous execution.
  Includes LaTeX source, a generated PDF, examples, and inspection labs.

## Building guides

Use a LaTeX distribution with `latexmk` and the packages required by each source.
The Mojo track includes a Makefile and [build instructions](ai-compilers/mojo/README.md).
